import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/keys.dart';

class DespesaCard extends StatelessWidget {
  const DespesaCard({
    Key key,
    this.despesaId,
  }) : super(key: key);
  final String despesaId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      distinct: true,
      converter: (store) => store.state.despesaState.despesaById[despesaId],
      builder: (BuildContext context, despesa) {
        return  ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          onTap: () {
            Keys.navKey.currentState.pushNamed(
              'despesa-page',
            );
          },
          title: Text(
            'Nome: ${despesa['nome']}',
            style: TextStyle( fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text('Categoria: ${despesa['categoria']}' ?? ''),
              ),
            ],
          ),
        );
      }
    );
    
  }
}