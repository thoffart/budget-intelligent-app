import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/redux/produto/produto-actions.dart';

@immutable
class CadastroProdutoPageModel {
  final Function(Map<String, dynamic> formValue) cadastroProduto;
  final Function(Map<String, dynamic> formValue) editFormProduto;

  CadastroProdutoPageModel({
    this.cadastroProduto,
    this.editFormProduto,
  });

  static CadastroProdutoPageModel fromStore(Store<AppState> store) => 
    CadastroProdutoPageModel(
      cadastroProduto: (Map<String, dynamic> formValue) => store.dispatch(CadastroProduto(formValue)),
      editFormProduto: (Map<String, dynamic> formValue) => store.dispatch(EditFormProduto(formValue)),
    );

}
