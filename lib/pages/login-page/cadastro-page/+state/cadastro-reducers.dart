import 'package:tcc_app/pages/login-page/cadastro-page/+state/cadastro-actions.dart';
import 'package:tcc_app/pages/login-page/cadastro-page/+state/cadastro-state.dart';
import 'package:redux/redux.dart';

final Reducer<CadastroState> cadastroReducer = combineReducers<CadastroState>([
  TypedReducer<CadastroState,CadastroAction>(_cadastroAction),
  TypedReducer<CadastroState,CadastroError>(_cadastroError),
  TypedReducer<CadastroState,CadastroSuccess>(_cadastroSuccess),
  TypedReducer<CadastroState,ChangePais>(_changePais),
  TypedReducer<CadastroState,ChangeObscureTextCadastro>(_changeObscureTextCadastro),
  TypedReducer<CadastroState,ChangeEmailEnabled>(_changeEmailEnabled),
]);

CadastroState _cadastroAction(CadastroState state, CadastroAction action) => state;

CadastroState _cadastroError(CadastroState state, CadastroError action) => state;

CadastroState _cadastroSuccess(CadastroState state, CadastroSuccess action) => state;

CadastroState _changePais(CadastroState state, ChangePais action) => state.copyWith(pais: action.pais);

CadastroState _changeObscureTextCadastro(CadastroState state, ChangeObscureTextCadastro action) => state.copyWith(obscureText: !state.obscureText);

CadastroState _changeEmailEnabled(CadastroState state, ChangeEmailEnabled action) => state.copyWith(emailEnabled: action.value);