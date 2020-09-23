import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/despesa-page/cadastro-produto-page/+model/cadastro-produto-page-model.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/despesa-page/cadastro-produto-page/form-produto-container/form-produto-container.dart';
import 'package:tcc_app/utils/constants/form-parameters.dart';
import 'package:tcc_app/utils/form-helper/form-helper.dart';


class CadastroProdutoPage extends StatefulWidget {
  final Map<String, dynamic> produto;
  static const String tag = 'cadastro-produto-page';

  CadastroProdutoPage(this.produto);

  @override
  _CadastroProdutoPageState createState() => _CadastroProdutoPageState();
}

class _CadastroProdutoPageState extends State<CadastroProdutoPage> {
  FormHelper formHelper;
  final Map<String, dynamic> _formValue = {};

  @override
  void initState() {
    super.initState();
    formHelper = (widget.produto != null) ? FormHelper.createWithValues(FormParameters.produto, widget.produto) : FormHelper.create(FormParameters.produto);
  }

  void addValueFormProduto(Map<String, dynamic> newValue) {
    _formValue.addAll(newValue);
  }


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CadastroProdutoPageModel>(
      distinct: true,
      converter: CadastroProdutoPageModel.fromStore,
      builder: (BuildContext context, CadastroProdutoPageModel cadastroProdutoPageModel) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.red),
            backgroundColor: Colors.white,
            title: Text('Budget Intelligent'),
          ),
          body: FormCadastroProdutoContainer(
            idProduto: (widget.produto != null) ? widget.produto['id'] : null,
            formHelper: formHelper,
            formValue: _formValue,
            addValueFormProduto: addValueFormProduto,
            cadastroProduto: cadastroProdutoPageModel.cadastroProduto,
            editFormProduto: cadastroProdutoPageModel.editFormProduto,
          ),
        );
      },
    );
  }
}