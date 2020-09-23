import 'package:dio/dio.dart';
import 'package:tcc_app/env.dart';

class BaseDioClient {
  

  static final Dio _client = Dio(
    BaseOptions(
      baseUrl: env.baseUrl,
      connectTimeout: 60000,
      receiveTimeout: 60000,
      sendTimeout: 60000,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
      }
    )
  );

  static Dio get client => _client; 

}
