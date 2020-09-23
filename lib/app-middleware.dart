import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/pages/login-page/+state/login-middleware.dart';
import 'package:tcc_app/pages/login-page/cadastro-page/+state/cadastro-middleware.dart';
import 'package:tcc_app/pages/startup-widget/+state/startup-widget-middleware.dart';
import 'package:tcc_app/redux/despesa/despesa-middleware.dart';
import 'package:tcc_app/redux/produto/produto-middleware.dart';
import 'package:tcc_app/redux/user/user-middleware.dart';
import 'package:redux/redux.dart';

final List<Middleware<AppState>> appMiddleware = [
  UserMiddleware(),
  LoginMiddleware(),
  CadastroMiddleware(),
  StartupWidgetMiddleware(),
  ProdutoMiddleware(),
  DespesaMiddleware(),
];
