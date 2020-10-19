
import 'package:graphql/client.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/client/base-graphql-client.dart';
import 'package:tcc_app/keys.dart';
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
        id_despesa
        quantidade
        nome
        valor
        created_at
    }
    }
  }
''';

const String createDespesaMutation = r'''
  mutation createDespesa($input: CreateDespesaInput!) {
    createDespesa(input: $input) {
      id
      nome
      categoria
      produto {
        id
        id_despesa
        quantidade
        nome
        valor
        created_at
    }
    }
  }
''';

const String updateDespesaMutation = r'''
  mutation updateDespesa($input: UpdateDespesaInput!) {
    updateDespesa(input: $input) {
      id
      nome
      categoria
      produto {
        id
        id_despesa
        quantidade
        nome
        valor
        created_at
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
      final MutationOptions _createDespesaMutationOptions = MutationOptions(
        documentNode: gql(createDespesaMutation),
        variables: <String, dynamic>{
          'input': action.formValue,
        }
      );
      final _createDespesaMutationResult = await BaseGraphQLClient.client.mutate(_createDespesaMutationOptions);

      if (!_createDespesaMutationResult.hasException) {
        print(_createDespesaMutationResult);
        store.dispatch(CadastroDespesaSuccess(_createDespesaMutationResult.data['createDespesa']));
      }
      
    }

    if (action is EditFormDespesa) {
      final MutationOptions _updateDespesaMutationOptions = MutationOptions(
        documentNode: gql(updateDespesaMutation),
        variables: <String, dynamic>{
          'input':{
            ...action.formValue,
            'id_usuario': (store.state as AppState).userState.user.id,
          },
        }
      );
      final _updateDespesaMutationResult = await BaseGraphQLClient.client.mutate(_updateDespesaMutationOptions);

      if (!_updateDespesaMutationResult.hasException) {
        print(_updateDespesaMutationResult);
        store.dispatch(EditFormDespesaSuccess(_updateDespesaMutationResult.data['updateDespesa']));
      }
      
    }

    if (action is CadastroDespesaSuccess) {
      await Keys.navKey.currentState.pop();
    }


    if (action is EditFormDespesaSuccess) {
      await Keys.navKey.currentState.pop();
    }

    if (action is CadastroDespesaError) {
      
    }

    next(action);
    
  }
}
