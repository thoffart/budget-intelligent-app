import 'package:meta/meta.dart';
import 'package:tcc_app/pages/login-page/+state/login-state.dart';
import 'package:tcc_app/pages/login-page/cadastro-page/+state/cadastro-state.dart';
import 'package:tcc_app/pages/startup-widget/+state/startup-widget-state.dart';
import 'package:tcc_app/redux/despesa/despesa-state.dart';
import 'package:tcc_app/redux/produto/produto-state.dart';
import 'package:tcc_app/redux/user/user-state.dart';

@immutable
class AppState {
  final UserState userState;
  final LoginState loginState;
  final CadastroState cadastroState;
  final StartupWidgetState startupWidgetState;
  final DespesaState despesaState;
  final ProdutoState produtoState;

  AppState({
    @required this.userState,
    @required this.loginState,
    @required this.cadastroState,
    @required this.startupWidgetState,
    @required this.despesaState,
    @required this.produtoState,
  });

  factory AppState.initial() {
    return AppState(
      userState: UserState.initial(),
      loginState: LoginState.initial(),
      cadastroState: CadastroState.initial(),
      startupWidgetState: StartupWidgetState.initial(),
      despesaState: DespesaState.initial(),
      produtoState: ProdutoState.initial(),
    );
  }

  AppState copyWith({
    UserState userState,
    LoginState loginState,
    CadastroState cadastroState,
    StartupWidgetState startupWidgetState,
    DespesaState despesaState,
    ProdutoState produtoState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      loginState: loginState ?? this.loginState,
      cadastroState: cadastroState ?? this.cadastroState,
      startupWidgetState: startupWidgetState ?? this.startupWidgetState,
      despesaState: despesaState ?? this.despesaState,
      produtoState: produtoState ?? this.produtoState,
    );
  }
}

