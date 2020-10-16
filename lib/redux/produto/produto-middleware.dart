
import 'package:graphql/client.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/client/base-graphql-client.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/redux/despesa/despesa-actions.dart';
import 'package:tcc_app/redux/produto/produto-actions.dart';

const String createProdutoMutation = r'''
  mutation createProduto($input: CreateProdutoInput!) {
    createProduto(input: $input) {
      id
      id_despesa
      quantidade
      valor
      nome
    }
  }
''';

const String updateProdutoMutation = r'''
  mutation updateProduto($input: UpdateProdutoInput!) {
    updateProduto(input: $input) {
      id
      id_despesa
      quantidade
      valor
      nome
    }
  }
''';


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
      final MutationOptions _createProdutoMutationOptions = MutationOptions(
        documentNode: gql(createProdutoMutation),
        variables: <String, dynamic>{
          'input': action.formValue,
        }
      );
      final _createProdutoMutationResult = await BaseGraphQLClient.client.mutate(_createProdutoMutationOptions);

      if (!_createProdutoMutationResult.hasException) {
        print(_createProdutoMutationResult);
        store.dispatch(AddProdutoToDespesa( _createProdutoMutationResult.data['createProduto']['id_despesa'].toString(), _createProdutoMutationResult.data['createProduto']['id']));
        store.dispatch(CadastroProdutoSuccess(_createProdutoMutationResult.data['createProduto']));
      }
    }

    if (action is EditFormProduto) {
      final MutationOptions _updateProdutoMutationOptions = MutationOptions(
        documentNode: gql(updateProdutoMutation),
        variables: <String, dynamic>{
          'input': action.formValue,
        }
      );
      final _updateProdutoMutationResult = await BaseGraphQLClient.client.mutate(_updateProdutoMutationOptions);

      if (!_updateProdutoMutationResult.hasException) {
        print(_updateProdutoMutationResult);
        store.dispatch(EditFormProdutoSuccess(_updateProdutoMutationResult.data['updateProduto']));
      }
    }

    if (action is CadastroProdutoSuccess) {
      await Keys.navKey.currentState.pop();
    }


    if (action is EditFormProdutoSuccess) {
      await Keys.navKey.currentState.pop();
    }

    if (action is CadastroProdutoError) {
      
    }

    next(action);

  }
}
