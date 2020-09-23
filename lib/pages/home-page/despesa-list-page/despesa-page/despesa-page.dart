import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/despesa-page/+model/despesa-page-model.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/despesa-page/cadastro-produto-page/cadastro-produto-page.dart';
import 'package:tcc_app/utils/despesa-card/despesa-card.dart';
import 'package:tcc_app/utils/produto-card/produto-card.dart';

class DespesaPage extends StatelessWidget {
  static const tag = 'despesa-page';
  const DespesaPage({
    Key key,
    this.despesaId
  }) : super(key: key);
  final String despesaId;

  Widget _buildCardDespesa() => DespesaCard(despesaId: despesaId);
   
   
  Widget _buildProdutoListCard(int index, Map<String, dynamic> produtoById) => ProdutoCard(produtoId: produtoById.keys.toList()[index]);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DespesaPageModel>(
      distinct: true,
      converter: (store) => DespesaPageModel.fromStore(store, despesaId),
      builder: (BuildContext context, despesaPageModel) {
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text(despesaPageModel.despesa['nome']),
            actions: [
              InkWell(onTap: () => Keys.navKey.currentState.pushNamed(CadastroProdutoPage.tag), child: Text('Adicionar Produto')),
            ],
          ),
          body: ListView.builder(
            itemCount: despesaPageModel.despesa['produto'].length + 1,
            itemBuilder: (context, index) => (index == 0) ? _buildCardDespesa() : _buildProdutoListCard(index - 1, despesaPageModel.produtoById),
          ),
        );
      }
    );
  }
}