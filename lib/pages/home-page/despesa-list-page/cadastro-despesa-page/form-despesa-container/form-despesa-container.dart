import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/cadastro-despesa-page/form-despesa-container/form-despesa-widget/form-despesa-widget.dart';
import 'package:tcc_app/utils/default-button/default-button.dart';
import 'package:tcc_app/utils/form-helper/form-helper.dart';


class FormCadastroDespesaContainer extends StatefulWidget {
  final int idDespesa;
  final FormHelper formHelper;
  final Map<String, dynamic> formValue;
  final Function(Map<String, dynamic> field) addValueFormDespesa;
  final Function(Map<String, dynamic> formValue) cadastroDespesa;
  final Function(Map<String, dynamic> formValue) editFormDespesa;
  const FormCadastroDespesaContainer({
    Key key,
    this.idDespesa,
    this.formHelper,
    this.formValue,
    this.addValueFormDespesa,
    this.cadastroDespesa,
    this.editFormDespesa,
  }) : super(key: key);
   @override
  _FormDespesaContainerState createState() => _FormDespesaContainerState();
}

class _FormDespesaContainerState extends State<FormCadastroDespesaContainer> {
  final _formDespesaContainerKey = GlobalKey<FormState>();

  InputDecoration inputFormDespesaDecoration(String hintText) => InputDecoration(
    labelText: hintText,
    alignLabelWithHint: true,
    labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
    errorStyle: TextStyle(color: Colors.purple[200]),
    fillColor:  Colors.indigo,
    contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(
        color: Colors.black
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(
        color: Colors.blueAccent
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(
        color: Colors.purple,
      ),
    ),
  );

  Form form(BuildContext context, FormHelper formHelper, InputDecoration Function(String hintText) inputFormDespesaDecoration) => Form(
    key: _formDespesaContainerKey,
    child: Column(
      children: <Widget>[
        FormCadastroDespesaWidget(
          formHelper: formHelper,
          formValue: widget.formValue,
          addValueFormDespesa: widget.addValueFormDespesa,
          inputFormDespesaDecoration: inputFormDespesaDecoration,
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child:  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: AutoSizeText(
                                (widget.idDespesa == null)
                                ? 'Cadastro Despesa'
                                : 'Edição Despesa',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        form(
                          context,
                          widget.formHelper,
                          inputFormDespesaDecoration,
                        ),
                        SizedBox(height: 8)
                      ],
                    ),
                  )
                ),
              ),
              Positioned(
                child: DefaultButton.icon(
                  onPressed: () {
                    if (_formDespesaContainerKey.currentState.validate()) {
                      _formDespesaContainerKey.currentState.save();
                      (widget.idDespesa == null) ? widget.cadastroDespesa({...widget.formValue}) :  widget.editFormDespesa({...widget.formValue, 'id': widget.idDespesa});
                    }
                  },
                  iconData: Icons.check,
                  iconColor: Colors.white,
                ),
                bottom: 20,
                right: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}