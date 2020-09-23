import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-middleware.dart';
import 'package:tcc_app/app-reducers.dart';
import 'package:tcc_app/app-routes.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/keys.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/pages/startup-widget/startup-widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  final store = Store<AppState>(
    rootReducer,
    initialState: AppState.initial(),
    middleware: appMiddleware,
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Moradia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Colors.blue,
        ),
        navigatorKey: Keys.navKey,
        home: StartupWidget(),
        routes: appRoutes,
        onGenerateRoute: generateRoutesWithArguments,
        builder: (context, child) => Scaffold(
          key: Keys.scaffoldKey,
          body: child,
        ),
      ),
    );
  }
}
