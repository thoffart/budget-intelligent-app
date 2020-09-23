import 'package:graphql/client.dart';
import 'package:tcc_app/client/base-graphql-client.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/pages/login-page/cadastro-page/+state/cadastro-actions.dart';
import 'package:redux/redux.dart';

class CadastroMiddleware extends MiddlewareClass {

  final String createUsuarioMutation = '''
    mutation createUsuario(\$input: UsuarioCreateInput!) {
      createUsuario(input: \$input) {
        nome
      }
    }
  ''';

  @override
  Future call(Store store, dynamic action, NextDispatcher next) async {
    if (action is CadastroAction) {
      try {
        final MutationOptions _createUsuarioMutationOptions = MutationOptions(
        documentNode: gql(createUsuarioMutation),
          variables: <String, dynamic>{
            'input': action.newUser
          }
        );
        final _createUsuarioMutationResult = await BaseGraphQLClient.client.mutate(_createUsuarioMutationOptions);

        if (_createUsuarioMutationResult.hasException) {
          store.dispatch(CadastroError('ops, algo deu errado!'));
        } else {
          store.dispatch(CadastroSuccess());
        }
      } on Exception {
        store.dispatch(CadastroError('ops, algo deu errado!'));
      }
    }

    if (action is CadastroSuccess) {
      if(Keys.navKey.currentState.canPop()) {
        await Keys.navKey.currentState.pop();
      }
    }

    next(action);
  }
}
