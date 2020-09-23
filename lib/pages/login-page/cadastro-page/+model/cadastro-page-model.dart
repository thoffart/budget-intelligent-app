import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/pages/login-page/cadastro-page/+state/cadastro-actions.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';


@immutable
class CadastroPageModel {
  final Function(Map<String, dynamic> newUser) cadastroAction;
  final Function(int pais) changePais;
  final int pais;
  final bool obscureText;
  final Function() changeObscuredText;
  final bool emailEnabled;
  final Function(bool value) changeEmailEnabled;

  CadastroPageModel({
    this.cadastroAction,
    this.changePais,
    this.pais,
    this.obscureText,
    this.changeObscuredText,
    this.emailEnabled,
    this.changeEmailEnabled,
  });

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is CadastroPageModel &&
          runtimeType == other.runtimeType &&
          pais == other.pais &&
          obscureText == other.obscureText &&
          emailEnabled == other.emailEnabled;

  @override
  int get hashCode => 
    pais.hashCode ^
    obscureText.hashCode ^
    emailEnabled.hashCode;

  static CadastroPageModel fromStore(Store<AppState> store) =>
      CadastroPageModel(
        cadastroAction: (Map<String, dynamic> newUser) => store.dispatch(CadastroAction(newUser)),
        changePais: (int pais) => store.dispatch(ChangePais(pais)),
        pais: store.state.cadastroState.pais,
        obscureText: store.state.cadastroState.obscureText,
        changeObscuredText: () => store.dispatch(ChangeObscureTextCadastro()),
        emailEnabled: store.state.cadastroState.emailEnabled,
        changeEmailEnabled: (bool value) => store.dispatch(ChangeEmailEnabled(value)),
      );
}
