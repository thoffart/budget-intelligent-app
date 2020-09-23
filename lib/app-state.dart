import 'package:meta/meta.dart';
import 'package:tcc_app/pages/login-page/+state/login-state.dart';
import 'package:tcc_app/pages/login-page/cadastro-page/+state/cadastro-state.dart';
import 'package:tcc_app/pages/startup-widget/+state/startup-widget-state.dart';
import 'package:tcc_app/redux/user/user-state.dart';

@immutable
class AppState {
  final UserState userState;
  final LoginState loginState;
  final CadastroState cadastroState;
  final StartupWidgetState startupWidgetState;

  AppState({
    @required this.userState,
    @required this.loginState,
    @required this.cadastroState,
    @required this.startupWidgetState,
  });

  factory AppState.initial() {
    return AppState(
      userState: UserState.initial(),
      loginState: LoginState.initial(),
      cadastroState: CadastroState.initial(),
      startupWidgetState: StartupWidgetState.initial(),
    );
  }

  AppState copyWith({
    UserState userState,
    LoginState loginState,
    CadastroState cadastroState,
    StartupWidgetState startupWidgetState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      loginState: loginState ?? this.loginState,
      cadastroState: cadastroState ?? this.cadastroState,
      startupWidgetState: startupWidgetState ?? this.startupWidgetState,
    );
  }
}

