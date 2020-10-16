import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/despesa-page/cadastro-produto-page/cadastro-produto-page.dart';

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
      builder: (BuildContext context, produto) {
        return  ListTile(
          onTap: () {
            Keys.navKey.currentState.pushNamed(CadastroProdutoPage.tag, arguments: {
                'id_despesa': produto['id_despesa'],
                'produto': produto,
              }
            );
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            'Produto: ${produto['nome']}',
            style: TextStyle( fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text('Valor: ${produto['valor'].toString()}' ?? ''),
              ),
            ],
          ),
        );
      }
    );
    
  }
}