import 'package:meta/meta.dart';

enum BuildFlavor { local, develop }

BuildEnvironment get env => _env;
BuildEnvironment _env;

class BuildEnvironment {
  final String baseUrl;
  final String baseUrlGraphql;
  final String baseWebSocket;
  final BuildFlavor flavor;

  BuildEnvironment._init({this.flavor, this.baseUrl, this.baseUrlGraphql, this.baseWebSocket});

  String getBaseUrl() => baseUrl;

  String getBaseUrlGraphql() => baseUrlGraphql;

  String getBaseWebSocket() => baseWebSocket;

  static void init({@required BuildFlavor flavor, @required String  baseUrl, @required  String baseUrlGraphql, @required String baseWebSocket}) => _env ??= BuildEnvironment._init(flavor: flavor, baseUrl: baseUrl, baseUrlGraphql: baseUrlGraphql, baseWebSocket: baseWebSocket);
}

