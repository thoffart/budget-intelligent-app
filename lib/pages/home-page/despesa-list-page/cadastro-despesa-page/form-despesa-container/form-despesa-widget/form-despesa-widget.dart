import 'package:flutter/material.dart';
import 'package:tcc_app/utils/form-helper/form-helper.dart';
import 'package:tcc_app/utils/validators/validators.dart';

class FormCadastroDespesaWidget extends StatelessWidget {
  const FormCadastroDespesaWidget({
    Key key,
    this.formHelper,
    this.formInfos,
    this.formValue,
    this.addValueFormDespesa,
    this.inputFormDespesaDecoration,
  }) : super(key: key);
  final FormHelper formHelper;
  final dynamic formInfos;
  final Map<String, dynamic> formValue;
  final Function(Map<String, dynamic> field) addValueFormDespesa;
  final InputDecoration Function(String hintText) inputFormDespesaDecoration;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 16),
          TextFormField(
            controller: formHelper.attributes['nome']['controller'],
            onSaved: (value) {
              addValueFormDespesa({'nome': value});
            },
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            validator: (value) => emptyValidator(value, ' nome'),
            focusNode: formHelper.attributes['nome']['focusNode'],
            maxLength: 250,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(formHelper.attributes['categoria']['focusNode']);
            },
            decoration: inputFormDespesaDecoration(
              'Nome',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: formHelper.attributes['categoria']['controller'],
            onSaved: (value) {
              addValueFormDespesa({'categoria': value});
            },
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            validator: (value) => emptyValidator(value, ' categoria'),
            focusNode: formHelper.attributes['categoria']['focusNode'],
            maxLength: 250,
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
            decoration: inputFormDespesaDecoration(
              'Categoria',
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}