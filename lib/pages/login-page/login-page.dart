import 'package:tcc_app/app-state.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/pages/login-page/+model/login-page-model.dart';
import 'package:tcc_app/pages/login-page/esqueceu-senha-dialog/esqueceu-senha-dialog.dart';
import 'package:tcc_app/utils/curve-painter/curve-painter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LoginPage extends StatefulWidget {
  static const String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLogin = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _forgetPasswordLabel(void Function(Map<String, dynamic> email) esqueceuSenhaAction) => Row(
    children: <Widget>[
      Expanded(
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 14,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Esqueceu Sua Senha?',
                style: TextStyle(
                  color: Colors.blue,
                  
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async => await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return EsqueceuSenhaDialog(esqueceuSenhaAction);
                  }
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      )
    ],
  );

  InputDecoration _inputDecoration(Icon icon, String hintText, [IconData suffixIcon, Function changeObscuredText]) => InputDecoration(
    icon: icon,
    hintText: hintText,
    fillColor:  Colors.red,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black
      )
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red)
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red)
    ),
    suffixIcon: suffixIcon == null ? null : InkWell(
      child: Icon(suffixIcon, color: Colors.grey),
      onTap: () => changeObscuredText(),
    ),
  );

  Widget _form(bool obscuredText, Function changeObscuredText) => Form(
    key: _formLogin,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          key: Key('e-mail'),
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
          decoration: _inputDecoration(Icon(Icons.email, color: Colors.grey), 'Email'),
        ),
        SizedBox(height: 4),
        TextFormField(
          key: Key('password'),
          controller: _passwordController,
          autofocus: false,
          obscureText: obscuredText,
          validator: (value) {
            if (value.isEmpty) {
              return 'Por favor digite uma senha';
            }
            return null;
          },
          decoration: _inputDecoration(Icon(Icons.lock, color: Colors.grey), 'Senha', obscuredText ? Icons.remove_red_eye : Icons.done, changeObscuredText),
        ),
      ],
    )
  );

  Widget _buildLogo() {
    var customPaint = CustomPaint(
          painter: CurvePainter(),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Image.asset(
              'assets/images/logo-branco.png',
            ),
          ),
        );
    return Stack(
    alignment: Alignment.topLeft,
    children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.red[300], Colors.red[900]]
          ),
        ),
        child: customPaint,
      ),
      Padding(
        padding: EdgeInsets.only(left: 24, top: 50),
        child: InkWell(
          onTap: Keys.navKey.currentState.pop,
          child: Icon(Icons.arrow_back_ios, color: Colors.white)
        ),
      ),
    ],
  );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginPageModel>(
      distinct: true,
      converter: LoginPageModel.fromStore,
      builder: (BuildContext context, loginPageModel) {
        return Scaffold(
          resizeToAvoidBottomPadding: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: <Widget>[
                _buildLogo(),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: _form(loginPageModel.obscuredText, loginPageModel.changeObscuredText),
                ),
                SizedBox(height: 32),
                RaisedButton(
                  onPressed: () {
                    if (!loginPageModel.isLogging && _formLogin.currentState.validate()) {
                      loginPageModel.changeIsLogging();
                      var formText = { 'email': _emailController.text,  'password': _passwordController.text };
                      loginPageModel.loginAction(formText);
                    }
                  },
                  child: Text('ENTRAR'),
                  textColor: Colors.white,
                  color: Colors.red,
                ),
                SizedBox(height: 16),
                _forgetPasswordLabel(loginPageModel.esqueceuSenhaAction),
                SizedBox(height: 32),
              ],
            ),
          )
        );
      }
    );
  }

}
