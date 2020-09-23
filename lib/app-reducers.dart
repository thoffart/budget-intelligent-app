
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/pages/login-page/+state/login-actions.dart';
import 'package:tcc_app/pages/login-page/+state/login-reducers.dart';
import 'package:tcc_app/pages/login-page/cadastro-page/+state/cadastro-reducers.dart';
import 'package:tcc_app/pages/startup-widget/+state/startup-widget-reducer.dart';
import 'package:tcc_app/redux/despesa/despesa-reducers.dart';
import 'package:tcc_app/redux/produto/produto-reducers.dart';
import 'package:tcc_app/redux/user/user-reducers.dart';

AppState appReducers(AppState state, dynamic action) => AppState(
  userState: userReducers(state.userState, action),
  loginState: loginReducer(state.loginState, action),
  cadastroState: cadastroReducer(state.cadastroState, action),
  startupWidgetState: startupWidgetReducer(state.startupWidgetState, action),
  produtoState: produtoReducer(state.produtoState, action),
  despesaState: despesaReducer(state.despesaState, action),
);

AppState rootReducer(AppState state,dynamic action) {
  if(action is LogoutAction) {
    return appReducers(AppState.initial(), action);
  }
  return appReducers(state, action);
}
