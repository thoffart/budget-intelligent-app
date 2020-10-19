import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:collection/collection.dart';
import 'package:tcc_app/redux/despesa/despesa-selectors.dart';
import 'package:tcc_app/redux/produto/produto-selectors.dart';


@immutable
class DashboardPageModel{

  final Map<String, Map<String, dynamic>> despesa;
  final Map<String, Map<String, dynamic>> produto;
  final List gastorPorDia;
  final double valorTotal;

  DashboardPageModel({
    this.despesa,
    this.produto,
    this.gastorPorDia,
    this.valorTotal,
  });

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is DashboardPageModel &&
          runtimeType == other.runtimeType &&
          valorTotal == other.valorTotal &&
          MapEquality<String, dynamic>().equals(despesa, other.despesa) &&
          ListEquality().equals(gastorPorDia, other.gastorPorDia) &&
          MapEquality<String, dynamic>().equals(produto, other.produto);
          
  @override
  int get hashCode => 
    valorTotal.hashCode ^
    gastorPorDia.hashCode ^
    produto.hashCode ^
    despesa.hashCode;

  static DashboardPageModel fromStore(Store<AppState> store) =>
    DashboardPageModel(
      despesa: despesaByIdSelector(store.state),
      produto: produtoByIdSelector(store.state),
      valorTotal: valorTotalOfProdutos(store.state),
      gastorPorDia: gastosPorDia(store.state),
    );

}