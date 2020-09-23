import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:collection/collection.dart';
import 'package:tcc_app/redux/despesa/despesa-selectors.dart';


@immutable
class DespesaListPageModel{

  final Map<String, Map<String, dynamic>> despesaById;

  DespesaListPageModel({
    this.despesaById,
  });

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is DespesaListPageModel &&
          runtimeType == other.runtimeType &&
          MapEquality<String, dynamic>().equals(despesaById, other.despesaById);
          
  @override
  int get hashCode => 
    despesaById.hashCode;

  static DespesaListPageModel fromStore(Store<AppState> store) =>
    DespesaListPageModel(
      despesaById: despesaByIdSelector(store.state),
    );

}