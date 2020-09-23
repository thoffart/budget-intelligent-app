
import 'package:redux/redux.dart';
import 'package:tcc_app/redux/produto/produto-actions.dart';

class ProdutoMiddleware extends MiddlewareClass {

  @override
  void call(Store store, dynamic action, NextDispatcher next) async {

    if (action is GetProdutoFirstTime) {
      
    }

    if (action is GetProdutoFirstTimeSuccess) { 

    }
  
    if (action is RefreshProduto) {
      
    }

    if (action is RefreshProdutoSuccess) {

    }
    
    if (action is CadastroProduto) {
      
    }

    if (action is EditFormProduto) {
      
    }

    if (action is CadastroProdutoSuccess) {

    }


    if (action is EditFormProdutoSuccess) {

    }

    if (action is CadastroProdutoError) {
      
    }

    next(action);

  }
}
