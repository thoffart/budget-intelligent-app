import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tcc_app/keys.dart';
import 'package:tcc_app/pages/login-page/login-page.dart';
import 'package:tcc_app/utils/curve-painter/curve-painter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class IntroductionPage extends StatefulWidget {
  static String tag = 'introduction-page';
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  int _currentIndexCarrousel = 0;

  final List<Map<String, String>> _carrouselItems = [
    {
      'title': 'Despesas',
      'subtitle': 'Crie despesas customizáveis.'
    },
    {
      'title': 'Produtos',
      'subtitle': 'Cadastre produtos utilizando a câmera de seu celular.'
    }
  ];


  Widget _signInLabel() => Row(
    children: <Widget>[
      Expanded(
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 14,
            ),
            children: <TextSpan>[
              TextSpan(text: 'Não tem conta? '),
              TextSpan(
                text: 'Cadastre-se',
                style: TextStyle(
                  color: Colors.blue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Keys.navKey.currentState.pushNamed('cadastro-page'),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      )
    ],
  );

  Widget _carouselTexts() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1,
          height: 80.0,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndexCarrousel = index;
            });
          }
        ),
        items: _carrouselItems.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AutoSizeText(item['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center),
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AutoSizeText(item['subtitle'], style: TextStyle(fontSize: 14, color: Colors.grey[800]), textAlign: TextAlign.center),
                      )
                    ],
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          _carrouselItems.length,
          (index) => Container(
            width: 6.0,
            height: 6.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndexCarrousel == index
                ? Colors.purple
                : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          ),
        ), 
      )
    ],
  );

  Widget _buildCustomButton(
    Color buttonColor,
    Color iconBackgroundColor,
    Icon icon,
    AutoSizeText text,
    void Function() onTap,
    {
      double buttonHeigth = 50,
      double buttonWidth = 250,
      double radius = 32,
      Border border,
    }
  ) => InkWell(
    onTap: onTap,
    child: Container(
      height: buttonHeigth,
      width: buttonWidth,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: buttonColor
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              width: 36,
              height: 36,
              child: icon
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: text,
          ),
        ],
      ),
    ),
  );

  Widget _buildLogo() => Container(
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
      child: Center(child: AutoSizeText('Budget Intelligent', style: TextStyle(color: Colors.white, fontSize: 64), textAlign: TextAlign.center,)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _buildLogo(),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: _carouselTexts()
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildCustomButton(
                  Colors.white,
                  Colors.purple,
                  Icon(Icons.email, color: Colors.white, size: 20),
                  AutoSizeText('Entrar com Email', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                  () => Keys.navKey.currentState.pushNamed(LoginPage.tag),
                  border: Border.all(color: Colors.grey),
                ),
                SizedBox(height: 16),
                _signInLabel(),
                SizedBox(height: 32),
              ],
            )
          )
        ],
      )
    );
  }

}