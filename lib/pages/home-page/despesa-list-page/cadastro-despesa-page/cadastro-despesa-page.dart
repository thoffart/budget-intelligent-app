import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/cadastro-despesa-page/+model/cadastro-despesa-page-model.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/cadastro-despesa-page/form-despesa-container/form-despesa-container.dart';
import 'package:tcc_app/utils/constants/form-parameters.dart';
import 'package:tcc_app/utils/form-helper/form-helper.dart';


class CadastroDespesaPage extends StatefulWidget {
  final Map<String, dynamic> despesa;
  static const String tag = 'cadastro-despesa-page';

  CadastroDespesaPage(this.despesa);

  @override
  _CadastroDespesaPageState createState() => _CadastroDespesaPageState();
}

class _CadastroDespesaPageState extends State<CadastroDespesaPage> {
  FormHelper formHelper;
  final Map<String, dynamic> _formValue = {};

  @override
  void initState() {
    super.initState();
    formHelper = (widget.despesa != null) ? FormHelper.createWithValues(FormParameters.despesa, widget.despesa) : FormHelper.create(FormParameters.despesa);
  }

  void addValueFormDespesa(Map<String, dynamic> newValue) {
    _formValue.addAll(newValue);
  }


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CadastroDespesaPageModel>(
      distinct: true,
      converter: CadastroDespesaPageModel.fromStore,
      builder: (BuildContext context, CadastroDespesaPageModel cadastroDespesaPageModel) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.red),
            backgroundColor: Colors.white,
            title: Text('Budget Intelligent'),
          ),
          body: FormCadastroDespesaContainer(
            idDespesa: (widget.despesa != null) ? int.parse(widget.despesa['id']) : null,
            formHelper: formHelper,
            formValue: _formValue,
            addValueFormDespesa: addValueFormDespesa,
            cadastroDespesa: cadastroDespesaPageModel.cadastroDespesa,
            editFormDespesa: cadastroDespesaPageModel.editFormDespesa,
          ),
        );
      },
    );
  }
}
