import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/redux/despesa/despesa-actions.dart';

@immutable
class CadastroDespesaPageModel {
  final Function(Map<String, dynamic> formValue) cadastroDespesa;
  final Function(Map<String, dynamic> formValue) editFormDespesa;

  CadastroDespesaPageModel({
    this.cadastroDespesa,
    this.editFormDespesa,
  });

  static CadastroDespesaPageModel fromStore(Store<AppState> store) => 
    CadastroDespesaPageModel(
      cadastroDespesa: (Map<String, dynamic> formValue) => store.dispatch(CadastroDespesa(formValue)),
      editFormDespesa: (Map<String, dynamic> formValue) => store.dispatch(EditFormDespesa(formValue)),
    );

}
