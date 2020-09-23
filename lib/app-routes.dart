
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc_app/pages/home-page/home-page.dart';
import 'package:tcc_app/pages/introduction-page/introduction-page.dart';
import 'package:tcc_app/pages/login-page/login-page.dart';

import 'pages/login-page/cadastro-page/cadastro-page.dart';


Route<dynamic> generateRoutesWithArguments(RouteSettings settings) {

  if(appRoutesWithArgumentsNames.contains(settings.name)) {
    final Map<String, WidgetBuilder> appRoutes = <String, WidgetBuilder>{};
    WidgetBuilder builder = appRoutes[settings.name];
    return MaterialPageRoute(builder: (context) => builder(context));
  }
  return null;

}

const List<String> appRoutesWithArgumentsNames = [];

final Map<String, WidgetBuilder> appRoutes = <String, WidgetBuilder>{
  IntroductionPage.tag: (BuildContext context) => IntroductionPage(),
  LoginPage.tag: (BuildContext context) => LoginPage(),
  CadastroPage.tag: (BuildContext context) => CadastroPage(),
  HomePage.tag: (BuildContext context) => HomePage(),
};

