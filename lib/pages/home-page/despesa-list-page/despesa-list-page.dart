import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/+model/despesa-lista-page-model.dart';
import 'package:tcc_app/utils/despesa-card/despesa-card.dart';

class DespesaListPage extends StatelessWidget {
  const DespesaListPage({Key key}) : super(key: key);

  Widget _buildDespesaListCard(Map<String, Map<String, dynamic>> despesaById) => ListView.builder(
    itemCount: despesaById.length,
    itemBuilder: (context, index) => DespesaCard(despesaId: despesaById.keys.toList()[index],),
  );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DespesaListPageModel>(
      distinct: true,
      converter: DespesaListPageModel.fromStore,
      builder: (BuildContext context, despesaListPageModel) {
        return (despesaListPageModel.despesaById.isEmpty)
        ? Container(
            child: Center(child: Text('Não há despesas!')),
          )
        : _buildDespesaListCard(despesaListPageModel.despesaById);
      }
    );
  }
}