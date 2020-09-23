import 'package:graphql/client.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/client/base-graphql-client.dart';
import 'package:tcc_app/models/user.dart';
import 'package:tcc_app/pages/startup-widget/+state/startup-widget-actions.dart';
import 'package:tcc_app/redux/user/user-actions.dart';
import 'package:redux/redux.dart';

String _meQuery = '''
  query me {
    me {
      id
      nome
      sobrenome
      email
      auth_token
      roles{
        name
      }
      despesa {
        id
        nome
        categoria
        produto {
          nome
          quantidade
          valor
        }
      }
    }
  }''';

class UserMiddleware extends MiddlewareClass<AppState> {
  
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async {

    if (action is UpdateUser) {
      final _opts = QueryOptions(documentNode: gql(_meQuery));
      final _meQueryResult = await BaseGraphQLClient.client.query(_opts);
      if (_meQueryResult.hasException) {
        print('Erro da query me!');
        print(_meQueryResult.exception);
      } else {
        final user = User.fromJson(
          _meQueryResult.data['me']..addAll({
            'auth_token': store.state.userState.user.authToken,
          }),
        );
        store.dispatch(UpdateUserSuccess(user));
        store.dispatch(UpdateUserPreferences(user));
      }
    }

    if (action is UpdateUserSuccess) {
      
    }

    next(action);

  }
}
