import 'package:tcc_app/keys.dart';
import 'package:tcc_app/pages/introduction-page/introduction-page.dart';
import 'package:tcc_app/pages/login-page/+state/login-actions.dart';
import 'package:tcc_app/pages/login-page/login-page.dart';
import 'package:tcc_app/pages/startup-widget/+state/startup-widget-actions.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class LoginMiddleware extends MiddlewareClass {

  @override
  Future call(Store store, dynamic action, NextDispatcher next) async {

    if (action is LoginAction) {

      final formData = {
        'username' : action.userLogin['email'],
        'password' : action.userLogin['password'],
      };
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

    if (action is CadastroPage) {
      await Keys.navKey.currentState.pushNamed('cadastro-page');
    }

    if (action is LoginSuccess) {

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
        //clearAuthInterceptor();
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