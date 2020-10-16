import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/+model/despesa-lista-page-model.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/cadastro-despesa-page/cadastro-despesa-page.dart';
import 'package:tcc_app/utils/default-button/default-button.dart';
import 'package:tcc_app/utils/despesa-card/despesa-card.dart';

class DespesaListPage extends StatelessWidget {
  const DespesaListPage({Key key}) : super(key: key);

  Widget _buildDespesaListCard(Map<String, Map<String, dynamic>> despesaById) => ListView.builder(
    itemCount: despesaById.length,
    itemBuilder: (context, index) => Card(
      child: DespesaCard(despesaId: despesaById.keys.toList()[index],),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DespesaListPageModel>(
      distinct: true,
      converter: DespesaListPageModel.fromStore,
      builder: (BuildContext context, despesaListPageModel) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget> [
                  (despesaListPageModel.despesaById.isEmpty)
                    ? Container(
                        child: Center(child: Text('Não há despesas!')),
                      )
                    : _buildDespesaListCard(despesaListPageModel.despesaById),
                    Positioned(
                      child: DefaultButton.icon(
                        iconData: Icons.add,
                        iconColor: Colors.white,
                        onPressed: () => Keys.navKey.currentState.pushNamed(CadastroDespesaPage.tag),
                      ),
                      bottom: 20,
                      right: 20,
                    ),
                ],
              ),
            )
          ],
        );
      }
    );
  }
}