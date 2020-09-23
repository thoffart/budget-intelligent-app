
import 'package:graphql/client.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/client/base-graphql-client.dart';
import 'package:tcc_app/redux/despesa/despesa-actions.dart';
import 'package:tcc_app/redux/produto/produto-actions.dart';


final String getAllDespesaQuery = r'''
  query getAllDespesa($filter: DespesaFilterInput) {
    getAllDespesa(filter: $filter) {
      id
      nome
      categoria
      produto {
        id
        quantidade
        nome
        valor
    }
    }
  }
''';

class DespesaMiddleware extends MiddlewareClass {

  @override
  void call(Store store, dynamic action, NextDispatcher next) async {

    if (action is GetDespesaFirstTime) {
      final QueryOptions _getAllDespesaOptions = QueryOptions(
        documentNode: gql(getAllDespesaQuery),
        variables: <String, dynamic>{
          'filter': {
            'id_usuario': (store.state as AppState).userState.user.id,
          }
        }
      );
      final _getAllDespesaQuery = await BaseGraphQLClient.client.query(_getAllDespesaOptions);
      if (_getAllDespesaQuery.hasException) {
        print('error');
      } else {
        store.dispatch(UpdateProdutoById((_getAllDespesaQuery.data['getAllDespesa'] as List).map((despesa) => despesa['produto']).expand((produto) => produto).toList()));
        store.dispatch(GetDespesaFirstTimeSuccess(_getAllDespesaQuery.data['getAllDespesa']));
      }
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

    next(action);
    
  }
}
