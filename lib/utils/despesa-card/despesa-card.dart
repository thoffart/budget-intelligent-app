import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/despesa-page/despesa-page.dart';

class DespesaCard extends StatelessWidget {
  const DespesaCard({
    Key key,
    this.despesaId,
    this.isClickable = true,
  }) : super(key: key);
  final String despesaId;
  final bool isClickable;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      distinct: true,
      converter: (store) => store.state.despesaState.despesaById[despesaId],
      builder: (BuildContext context, despesa) {
        return  ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          onTap: () {
            if(isClickable) {
              Keys.navKey.currentState.pushNamed(
                DespesaPage.tag,
                arguments: despesaId,
              );
            }
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