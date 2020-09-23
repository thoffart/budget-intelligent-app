import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:collection/collection.dart';
import 'package:tcc_app/redux/despesa/despesa-selectors.dart';
import 'package:tcc_app/redux/produto/produto-selectors.dart';


@immutable
class DespesaPageModel{

  final Map<String, dynamic> despesa;
  final Map<String, Map<String, dynamic>> produtoById;

  DespesaPageModel({
    this.despesa,
    this.produtoById,
  });

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is DespesaPageModel &&
          runtimeType == other.runtimeType &&
          MapEquality<String, dynamic>().equals(despesa, other.despesa) &&
          MapEquality<String, Map<String, dynamic>>().equals(produtoById, other.produtoById);
          
  @override
  int get hashCode => 
    despesa.hashCode;

  static DespesaPageModel fromStore(Store<AppState> store, String despesaID) =>
    DespesaPageModel(
      despesa: despesaByIdSelector(store.state)[despesaID],
      produtoById: produtoByIdSelector(store.state),
    );

}