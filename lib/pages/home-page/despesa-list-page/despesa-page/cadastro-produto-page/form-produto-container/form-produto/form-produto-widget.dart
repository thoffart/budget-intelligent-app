import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:tcc_app/utils/form-helper/form-helper.dart';
import 'package:tcc_app/utils/validators/validators.dart';

class FormCadastroProdutoWidget extends StatelessWidget {
  const FormCadastroProdutoWidget({
    Key key,
    this.formHelper,
    this.formInfos,
    this.formValue,
    this.addValueFormProduto,
    this.inputFormProdutoDecoration,
  }) : super(key: key);
  final FormHelper formHelper;
  final dynamic formInfos;
  final Map<String, dynamic> formValue;
  final Function(Map<String, dynamic> field) addValueFormProduto;
  final InputDecoration Function(String hintText) inputFormProdutoDecoration;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 16),
          TextFormField(
            controller: formHelper.attributes['nome']['controller'],
            onSaved: (value) {
              addValueFormProduto({'nome': value});
            },
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            validator: (value) => emptyValidator(value, ' nome'),
            focusNode: formHelper.attributes['nome']['focusNode'],
            maxLength: 250,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(formHelper.attributes['conta_valor_total']['focusNode']);
            },
            decoration: inputFormProdutoDecoration(
              'Nome',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: formHelper.attributes['quantidade']['controller'],
            onSaved: (value) {
              String valor = (formHelper.attributes['quantidade']['controller'] as TextEditingController).text;
              addValueFormProduto({'quantidade': int.parse(valor)});
            },
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
            focusNode: formHelper.attributes['quantidade']['focusNode'],
            maxLength: 250,
            decoration: inputFormProdutoDecoration(
              'Quantidade',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: formHelper.attributes['valor']['controller'],
            onSaved: (value) {
              addValueFormProduto({'valor': (formHelper.attributes['valor']['controller'] as MoneyMaskedTextController).numberValue});
            },
            validator: (value) => emptyValidator(value,  'valor'),
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
            focusNode: formHelper.attributes['valor']['focusNode'],
            decoration: inputFormProdutoDecoration(
              'Valor',
            ),
          ),
        ],
      ),
    );
  }
}