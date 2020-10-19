import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/pages/home-page/dashboard-page/+model/dashboard-page-model.dart';
import 'package:tcc_app/utils/vertical-bar-chart/vertical-bar-chart.dart';

class DashboardPage extends StatelessWidget {

  const DashboardPage({Key key}) : super(key: key);


  Widget _buildTile(Widget child) {
    return Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(16.0),
      shadowColor: Color(0x802196F3),
      child: child
    );
  }


  List<Widget> _buildDashboard(BuildContext context, int despesasTotal, int produtosTotal, double valorTotal, List gastorPorDia) {
    return [
      _buildTile(
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Despesas', style: TextStyle(color: Colors.black45)),
                  Text(despesasTotal.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                ],
              ),
              Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(24.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.shopping_bag, color: Colors.white, size: 30.0),
                  )
                )
              )
            ]
          ),
        )
      ),
      _buildTile(
        Padding(
         padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                color: Colors.teal,
                shape: CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.account_balance_wallet, color: Colors.white, size: 30.0),
                )
              ),
              Padding(padding: EdgeInsets.only(bottom: 16.0)),
              Text(produtosTotal.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
              AutoSizeText('Produtos', style: TextStyle(color: Colors.black45), maxLines: 1,),
            ]
          ),
        ),
      ),
      _buildTile(
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                color: Colors.amber,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.money_rounded, color: Colors.white, size: 30.0),
                )
              ),
              Padding(padding: EdgeInsets.only(bottom: 16.0)),
              Text('R\$ ${valorTotal.toStringAsFixed(2)}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
              AutoSizeText('Gastos', style: TextStyle(color: Colors.black45), maxLines: 1,),
            ]
          ),
        ),
      ),
      _buildTile(
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutoSizeText('Gastos nos últimos 7 dias', style: TextStyle(color: Colors.black45), maxLines: 1,),
              Container(
                width: MediaQuery.of(context).size.width - 80,
                height: 300,
                child: VerticalBarChart(gastorPorDia)
              ),
            ]
          ),
        ),
      ),
      SizedBox(height: 4),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DashboardPageModel>(
      distinct: true,
      converter: DashboardPageModel.fromStore,
      builder: (BuildContext context, dashboardPageModel) {
        return StaggeredGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            children: _buildDashboard(
              context,
              dashboardPageModel.despesa.length,
              dashboardPageModel.produto.length,
              dashboardPageModel.valorTotal,
              dashboardPageModel.gastorPorDia
            ),
            staggeredTiles: [
              StaggeredTile.fit(2),
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
              StaggeredTile.fit(2),
              StaggeredTile.fit(2),
            ],
          );
      }
    );
  }
}
