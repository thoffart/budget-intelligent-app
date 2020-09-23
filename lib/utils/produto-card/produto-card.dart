import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-state.dart';

class ProdutoCard extends StatelessWidget {
  const ProdutoCard({
    Key key,
    this.produtoId,
  }) : super(key: key);
  final String produtoId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      distinct: true,
      converter: (store) => store.state.produtoState.produtoById[produtoId],
      builder: (BuildContext context, despesa) {
        return  ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            'Produto: ${despesa['nome']}',
            style: TextStyle( fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text('Valor: ${despesa['valor'].toString()}' ?? ''),
              ),
            ],
          ),
        );
      }
    );
    
  }
}