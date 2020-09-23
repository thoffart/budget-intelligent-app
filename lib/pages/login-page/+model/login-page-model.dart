import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/pages/login-page/+state/login-actions.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

@immutable
class LoginPageModel{

  final Function(dynamic formText) loginAction;
  final Function() cadastroPage;
  final Function() changeObscuredText;
  final Function() changeIsLogging;
  final bool obscuredText;
  final bool hasError;
  final String errorMessage;
  final bool isLogging;
  final Function(Map<String, dynamic> email) esqueceuSenhaAction;

  LoginPageModel({
    this.loginAction,
    this.cadastroPage,
    this.hasError,
    this.changeObscuredText,
    this.changeIsLogging,
    this.obscuredText,
    this.errorMessage,
    this.isLogging,
    this.esqueceuSenhaAction,
  });

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is LoginPageModel &&
          runtimeType == other.runtimeType &&
          obscuredText == other.obscuredText &&
          hasError == other.hasError &&
          errorMessage == other.errorMessage &&
          isLogging == other.isLogging;

  @override
  int get hashCode => 
    obscuredText.hashCode ^
    hasError.hashCode ^
    errorMessage.hashCode ^
    isLogging.hashCode;

  static LoginPageModel fromStore(Store<AppState> store) =>
    LoginPageModel(
      loginAction: (formText) => store.dispatch(LoginAction(formText)),
      cadastroPage: () => store.dispatch(CadastroPage()),
      changeObscuredText: () => store.dispatch(ChangeObscuredText()),
      changeIsLogging: () => store.dispatch(ChangeIsLogging()),
      obscuredText: store.state.loginState.obscuredText,
      hasError: store.state.loginState.hasError,
      errorMessage: store.state.loginState.errorMessage,
      isLogging: store.state.loginState.isLogging,
      esqueceuSenhaAction: (Map<String, dynamic> email) => store.dispatch(EsqueceuSenhaAction(email)),
    );

}