import 'package:auto_size_text/auto_size_text.dart';
import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/utils/curve-painter/curve-painter.dart';
import 'package:tcc_app/pages/login-page/cadastro-page/+model/cadastro-page-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tcc_app/utils/default-button/default-button.dart';

class CadastroPage extends StatefulWidget {
  static String tag = 'cadastro-page';
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formCadastro = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  Widget _cadastroButton(Function dispatchCadastroAction) => Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: DefaultButton.text(
      width: 200,
      textColor: Colors.white,
      text: 'Cadastrar',
      onPressed: () {
        if (_formCadastro.currentState.validate()) {
          final Map<String, dynamic> formText = {
            'email': _emailController.text,
            'password': _passwordController.text,
            'nome': _nameController.text,
          };
          dispatchCadastroAction(formText);
        }
      },
    ),
  );

   InputDecoration _inputDecoration(Icon icon, String hintText, [IconData suffixIcon, Function changeObscuredText]) => InputDecoration(
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
      onTap: () => changeObscuredText(),
    ),
  );


  Widget _form(bool obscureText, Function changeObscureText) => Form(
    key: _formCadastro,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.text,
          maxLength: 100,
          autofocus: false,
          validator: (value) {
            if (value.isEmpty) {
              return 'Por favor digite um nome';
            }
            return null;
          },
          decoration: _inputDecoration(Icon(Icons.person, color: Colors.grey), 'Nome') ,
        ), 
        SizedBox(height: 4),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          maxLength: 100,
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
          decoration: _inputDecoration(Icon(Icons.email, color: Colors.grey), 'E-mail'),
        ), 
        SizedBox(height: 4),
        TextFormField(
          controller: _passwordController,
          autofocus: false,
          obscureText: obscureText,
          validator: (value) {
            if (value.isEmpty) {
              return 'Por favor digite uma senha';
            }
            return null;
          },
          decoration: _inputDecoration(Icon(Icons.lock, color: Colors.grey), 'Senha', obscureText ? Icons.remove_red_eye : Icons.done, changeObscureText) 
        ),
      ],
    )
  );


  Widget _buildLogo() => Stack(
    alignment: Alignment.topLeft,
    children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple[300], Colors.purple[900]]
          ),
        ),
        child: CustomPaint(
          painter: CurvePainter(),
          child: Center(child: AutoSizeText('Budget Intelligent', style: TextStyle(color: Colors.white, fontSize: 54), textAlign: TextAlign.center,)),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 24, top: MediaQuery.of(context).size.height * 0.1),
        child: InkWell(
          onTap: Keys.navKey.currentState.pop,
          child: Icon(Icons.arrow_back_ios, color: Colors.white)
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CadastroPageModel>(
      distinct: true,
      converter: CadastroPageModel.fromStore,
      builder: (BuildContext context, cadastroPageModel) {
        return Scaffold(
          resizeToAvoidBottomPadding: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: <Widget>[
                _buildLogo(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: <Widget>[
                      _form(cadastroPageModel.obscureText, cadastroPageModel.changeObscuredText),
                      SizedBox(height: 24),
                      _cadastroButton(cadastroPageModel.cadastroAction),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
                
              ],
            ),
          )
        );
      }
    );
  }

}