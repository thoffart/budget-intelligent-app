import 'package:hive/hive.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/env.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/models/user.dart';
import 'package:tcc_app/pages/introduction-page/introduction-page.dart';
import 'package:tcc_app/pages/login-page/+state/login-actions.dart';
import 'package:tcc_app/pages/startup-widget/+state/startup-widget-actions.dart';
import 'package:tcc_app/redux/user/user-actions.dart';
import 'package:redux/redux.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StartupWidgetMiddleware extends MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async {

    if (action is InitializeHive) {
      await Hive.initFlutter();
      Hive.registerAdapter(UserAdapter());
      store.dispatch(VerifyPreferences());
    }

    if (action is VerifyPreferences) {
      final Box userBox = await Hive.openBox<User>('user');
      final Box baseUrlBox = await Hive.openBox<String>('baseurl');
      final User user = userBox.isNotEmpty ? userBox.getAt(0) : null;
      final String baseurl = baseUrlBox.isNotEmpty ? baseUrlBox.getAt(0) : null;

      if (user != null && baseurl == env.baseUrl) {
        store.dispatch(LoginSuccess(user));
        store.dispatch(UpdateUser());
      } else {
        store.dispatch(DeletePreferences());
        await Keys.navKey.currentState.pushReplacementNamed(IntroductionPage.tag);
      }
    }

    if (action is DeletePreferences) {
      final Box userBox = await Hive.openBox<User>('user');
      final Box baseUrlBox = await Hive.openBox<String>('baseurl');
      await userBox.clear();
      await baseUrlBox.clear();
    }

    if (action is SavePreferences) {
      final Box userBox = await Hive.openBox<User>('user');
      final Box baseUrlBox = await Hive.openBox<String>('baseurl');
      await userBox.add(action.user);
      await baseUrlBox.add(env.baseUrl);
    }

    if (action is UpdateUserPreferences) {
      final Box userBox = await Hive.openBox<User>('user');
      await userBox.clear();
      await userBox.add(action.user);
    }

    next(action);
  }
}
