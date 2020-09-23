
import 'package:redux/redux.dart';
import 'package:tcc_app/redux/despesa/despesa-actions.dart';

class DespesaMiddleware extends MiddlewareClass {

  @override
  void call(Store store, dynamic action, NextDispatcher next) async {

    if (action is GetDespesaFirstTime) {
      
    }

    if (action is GetDespesaFirstTimeSuccess) { 

    }
  
    if (action is RefreshDespesa) {
      
    }

    if (action is RefreshDespesaSuccess) {

    }
    
    if (action is CadastroDespesa) {
      
    }

    if (action is EditFormDespesa) {
      
    }

    if (action is CadastroDespesaSuccess) {

    }


    if (action is EditFormDespesaSuccess) {

    }

    if (action is CadastroDespesaError) {
      
    }

  }
}
