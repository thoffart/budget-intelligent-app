import 'package:graphql/client.dart';
import 'package:tcc_app/client/base-graphql-client.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/models/user.dart';
import 'package:tcc_app/pages/home-page/home-page.dart';
import 'package:tcc_app/pages/introduction-page/introduction-page.dart';
import 'package:tcc_app/pages/login-page/+state/login-actions.dart';
import 'package:tcc_app/pages/login-page/login-page.dart';
import 'package:tcc_app/pages/startup-widget/+state/startup-widget-actions.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/redux/user/user-actions.dart';

final userQueryData = '''
  id
  nome
  sobrenome
  email
  auth_token
  roles{
    name
  }
  ''';

final String loginMutation = '''
  mutation login(\$input: LoginInput!) {
    login(input: \$input) {
      $userQueryData
    }
  }
''';

final String novaSenhaMutation = '''
  mutation novaSenha(\$input: NovaSenhaInput!) {
    novaSenha(input: \$input) {
      $userQueryData
    }
  }
''';

class LoginMiddleware extends MiddlewareClass {

  @override
  Future call(Store store, dynamic action, NextDispatcher next) async {

    if (action is LoginAction) {

      final MutationOptions _loginMutationOptions = MutationOptions(
        documentNode: gql(loginMutation),
        variables: <String, dynamic>{
          'input': action.userLogin
        }
      );
      final _loginMutationResult = await BaseGraphQLClient.client.mutate(_loginMutationOptions);

      if (_loginMutationResult.hasException) {
        store.dispatch(LoginError('ops, algo deu errado!'));
        store.dispatch(ChangeIsLogging());
      } else {
        final user = User.fromJson(_loginMutationResult.data['login']);
        store.dispatch(SavePreferences(user));
        store.dispatch(LoginSuccess(user));
      }

      try {
        
      } on Exception {
        store.dispatch(LoginError('ops, algo deu errado!'));
        store.dispatch(ChangeIsLogging());
      }
    }

    if (action is ForgotPasswordAction) {
      print(action);
    }

    if (action is LoginError) {
      print(action);
    }


    if (action is LoginSuccess) {
      BaseGraphQLClient.setAuthInterceptor('Bearer ${action.user.authToken}');
      store.dispatch(UpdateUserSuccess(action.user));
      store.dispatch(ChangeIsLogging());
      await Keys.navKey.currentState.pushNamedAndRemoveUntil(HomePage.tag, (Route<dynamic> route) => false);
    }

    if (action is ChangeObscuredText) {

    }

    if (action is LogoutAction) {
      bool isCurrentRouteLoginPage;
      Keys.navKey.currentState.popUntil((route) {
        isCurrentRouteLoginPage = route.settings.name == LoginPage.tag;
        return true;
      });
      if(!isCurrentRouteLoginPage) {
        store.dispatch(DeletePreferences());
        BaseGraphQLClient.clearAuthInterceptor();
        await Keys.navKey.currentState.pushNamedAndRemoveUntil(IntroductionPage.tag, (Route<dynamic> route) => false);
      }
    }

   if (action is EsqueceuSenhaAction) {
      
    }

    if (action is EsqueceuSenhaSuccess) {
      Keys.navKey.currentState.pop();
    }
    
    next(action);

  }
}