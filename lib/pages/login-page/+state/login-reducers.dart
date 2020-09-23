import 'package:tcc_app/pages/login-page/+state/login-actions.dart';
import 'package:tcc_app/pages/login-page/+state/login-state.dart';
import 'package:redux/redux.dart';

final Reducer<LoginState> loginReducer = combineReducers<LoginState>([
  TypedReducer<LoginState,LoginAction>(_loginAction),
  TypedReducer<LoginState,ForgotPasswordAction>(_forgotPasswordAction),
  TypedReducer<LoginState,LoginError>(_loginError),
  TypedReducer<LoginState,LoginSuccess>(_loginSuccess),
  TypedReducer<LoginState,ChangeObscuredText>(_changeObscuredText),
  TypedReducer<LoginState,LogoutAction>(_logoutAction),
  TypedReducer<LoginState,ChangeIsLogging>(_changeIsLogging),
  TypedReducer<LoginState,EsqueceuSenhaAction>(_esqueceuSenhaAction),
  TypedReducer<LoginState,EsqueceuSenhaError>(_esqueceuSenhaError),
  TypedReducer<LoginState,EsqueceuSenhaSuccess>(_esqueceuSenhaSuccess),
]);

LoginState _loginAction(LoginState state, LoginAction action){
  return state.copyWith(hasError: false);
}

LoginState _forgotPasswordAction(LoginState state, ForgotPasswordAction action) => state;

LoginState _loginError(LoginState state, LoginError action) {
  return state.copyWith(hasError: true, errorMessage: action.errorMessage);
}

LoginState _logoutAction(LoginState state, LogoutAction action) => state;

LoginState _loginSuccess(LoginState state, LoginSuccess action) => state;

LoginState _changeObscuredText(LoginState state, ChangeObscuredText action) => state.copyWith(obscuredText: !state.obscuredText);

LoginState _changeIsLogging(LoginState state, ChangeIsLogging action) => state.copyWith(isLogging: !state.isLogging);

LoginState _esqueceuSenhaAction(LoginState state, EsqueceuSenhaAction action) => state;

LoginState _esqueceuSenhaError(LoginState state, EsqueceuSenhaError action) => state;

LoginState _esqueceuSenhaSuccess(LoginState state, EsqueceuSenhaSuccess action) => state;

