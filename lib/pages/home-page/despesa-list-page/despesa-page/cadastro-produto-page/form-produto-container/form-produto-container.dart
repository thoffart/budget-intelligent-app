import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tcc_app/pages/home-page/despesa-list-page/despesa-page/cadastro-produto-page/form-produto-container/form-produto/form-produto-widget.dart';
import 'package:tcc_app/utils/default-button/default-button.dart';
import 'package:tcc_app/utils/form-helper/form-helper.dart';


class FormCadastroProdutoContainer extends StatefulWidget {
  final int idProduto;
  final FormHelper formHelper;
  final Map<String, dynamic> formValue;
  final Function(Map<String, dynamic> field) addValueFormProduto;
  final Function(Map<String, dynamic> formValue) cadastroProduto;
  final Function(Map<String, dynamic> formValue) editFormProduto;
  const FormCadastroProdutoContainer({
    Key key,
    this.idProduto,
    this.formHelper,
    this.formValue,
    this.addValueFormProduto,
    this.cadastroProduto,
    this.editFormProduto,
  }) : super(key: key);
   @override
  _FormProdutoContainerState createState() => _FormProdutoContainerState();
}

class _FormProdutoContainerState extends State<FormCadastroProdutoContainer> {
  final _formProdutoContainerKey = GlobalKey<FormState>();

  InputDecoration inputFormProdutoDecoration(String hintText) => InputDecoration(
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

  Form form(BuildContext context, FormHelper formHelper, InputDecoration Function(String hintText) inputFormProdutoDecoration) => Form(
    key: _formProdutoContainerKey,
    child: Column(
      children: <Widget>[
        FormCadastroProdutoWidget(
          formHelper: formHelper,
          formValue: widget.formValue,
          addValueFormProduto: widget.addValueFormProduto,
          inputFormProdutoDecoration: inputFormProdutoDecoration,
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
                                (widget.idProduto == null)
                                ? 'Cadastro Produto'
                                : 'Edição Produto',
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
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              form(
                                context,
                                widget.formHelper,
                                inputFormProdutoDecoration,
                              ),
                              SizedBox(height: 8),
                              RaisedButton(onPressed: (){}, child: Text('Identificar Produto'), color: Colors.purple, textColor: Colors.white,)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ),
              Positioned(
                child: DefaultButton.icon(
                  onPressed: () {
                    if (_formProdutoContainerKey.currentState.validate()) {
                      _formProdutoContainerKey.currentState.save();
                      (widget.idProduto == null) ? widget.cadastroProduto(widget.formValue) :  widget.editFormProduto({...widget.formValue, 'id': widget.idProduto});
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