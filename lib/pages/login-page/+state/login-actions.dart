import 'package:tcc_app/models/user.dart';

class LoginAction {
  final dynamic userLogin;
  LoginAction(this.userLogin);
}

class LoginError {
  final dynamic errorMessage;
  LoginError(this.errorMessage);
}

class ForgotPasswordAction { }

class CadastroPage { }

class LoginSuccess {
  final User user;
  LoginSuccess(this.user);
}

class ChangeObscuredText {
  ChangeObscuredText();
}

class ChangeIsLogging {
  ChangeIsLogging();
}

class EsqueceuSenhaAction {
  final Map<String, dynamic> email;
  EsqueceuSenhaAction(this.email);
}

class EsqueceuSenhaError { 
  final dynamic errorMessage;
  EsqueceuSenhaError(this.errorMessage);
}

class EsqueceuSenhaSuccess {
  EsqueceuSenhaSuccess();
}


class LogoutAction {
  LogoutAction();
}