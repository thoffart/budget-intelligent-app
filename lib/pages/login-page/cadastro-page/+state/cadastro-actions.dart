class CadastroAction {
  final Map<String, dynamic> newUser;
  CadastroAction(this.newUser);
}

class CadastroError { 
  final dynamic errorMessage;
  CadastroError(this.errorMessage);
}

class CadastroSuccess {
  CadastroSuccess();
}

class ChangePais {
  final int pais;
  ChangePais(this.pais);
}

class ChangeObscureTextCadastro {
  ChangeObscureTextCadastro();
}

class ChangeEmailEnabled {
  final bool value;
  ChangeEmailEnabled(this.value);
}