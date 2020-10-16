import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:collection/collection.dart';
import 'package:tcc_app/redux/despesa/despesa-selectors.dart';


@immutable
class DespesaPageModel{

  final Map<String, dynamic> despesa;

  DespesaPageModel({
    this.despesa,
  });

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is DespesaPageModel &&
          runtimeType == other.runtimeType &&
          MapEquality<String, dynamic>().equals(despesa, other.despesa);
          
  @override
  int get hashCode => 
    despesa.hashCode;

  static DespesaPageModel fromStore(Store<AppState> store, String despesaID) =>
    DespesaPageModel(
      despesa: despesaByIdSelector(store.state)[despesaID],
    );

}