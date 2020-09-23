import 'package:auto_size_text/auto_size_text.dart';
import 'package:tcc_app/utils/curve-painter/curve-painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EsqueceuSenhaDialog extends StatefulWidget {

  final void Function(Map<String, dynamic> email) esqueceuSenhaAction;

  EsqueceuSenhaDialog(this.esqueceuSenhaAction);

  @override
  _EsqueceuSenhaDialogState createState() => _EsqueceuSenhaDialogState();
}

class _EsqueceuSenhaDialogState extends State<EsqueceuSenhaDialog> {
  final _formEsqueceuSenha = GlobalKey<FormState>();
  final _emailController = TextEditingController();

   InputDecoration _inputDecoration(Icon icon, String hintText, [IconData suffixIcon, Function changeObscupurpleText]) => InputDecoration(
    icon: icon,
    hintText: hintText,
    fillColor:  Color.fromRGBO(79, 232, 234, 0.8),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.purple
      )
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.purple)
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.purple)
    ),
    suffixIcon: suffixIcon == null ? null : InkWell(
      child: Icon(suffixIcon, color: Colors.grey),
      onTap: () => changeObscupurpleText(),
    ),
  );

  Widget _form() => Form(
    key: _formEsqueceuSenha,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          validator: (value) {
            Pattern pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = RegExp(pattern);
            if (value.isEmpty) {
              return 'Por favor digite um e-mail';
            }
            if (!regex.hasMatch(value)) {
              return 'Entre com um e-mail válido';
            }
            return null;
          },
          decoration: _inputDecoration(Icon(Icons.email, color: Colors.purple), 'E-mail'),
        ), 
        SizedBox(height: 4),
      ],
    )
  );

  Widget _buildTopBar() => Container(
    width: MediaQuery.of(context).size.width,
    height: 70,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.purple[300], Colors.purple[900]]
      ),
    ),
    child: CustomPaint(
      painter: CurvePainter(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          children: <Widget>[
            Expanded(
              child: AutoSizeText('Recuperar Senha', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24), textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      contentPadding: EdgeInsets.all(0.0),
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child:  Column(
            children: <Widget>[
              _buildTopBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: _form(),
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  if (_formEsqueceuSenha.currentState.validate()) {
                    final Map<String, dynamic> formText = {
                      'email': _emailController.text,
                    };
                    widget.esqueceuSenhaAction(formText);
                  }
                }, 
                color: Colors.purple,
                child: Text('Enviar'),
                textColor: Colors.white,
                elevation: 0
              ),
              SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}