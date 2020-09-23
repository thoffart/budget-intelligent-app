import 'package:flutter/material.dart';
import 'package:tcc_app/env.dart';
import 'package:tcc_app/main.dart';

void main() {
  BuildEnvironment.init(
    flavor: BuildFlavor.local,
    baseUrl: 'http://192.168.0.116/api',
    baseUrlGraphql: 'http://192.168.0.116/api/graphql',
    baseWebSocket: 'ws://192.168.0.116/graphql'
  );
  assert(env != null);
  runApp(MyApp());
}