import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:tcc_app/env.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/utils/notification-modal-widget/notification-modal-widget.dart';

class BaseGraphQLClient {

  static GraphQLClient _client = initializeClient();

  static GraphQLClient initializeClient() {
    return GraphQLClient(
      cache: InMemoryCache(),
      link: Link.from([
        ErrorLink(errorHandler: (ErrorResponse response) async {
          OperationException exception = response.exception;
          if (exception.graphqlErrors.first.extensions['category'] == 'validation') {
            await showDialog(
              context: Keys.navKey.currentState.overlay.context,
              builder: (context) {
              return NotificationModalWidget(message: exception.graphqlErrors.first.extensions['validation'].values.first.first, messageType: MessageType.warning);
              }
            ); 
          }
        }),
        HttpLink(
          uri: env.baseUrlGraphql,
        )
      ])
    );
  }

  static void setAuthInterceptor(String accessToken) {
    final _authLink = AuthLink(
      getToken: () async => accessToken,
    ).concat(_client.link);
    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _authLink,
    );
  }

  static GraphQLClient get client => _client; 

  static void clearAuthInterceptor() {
    _client = initializeClient();
  }

}
