import 'package:dio/dio.dart';

class DioClient {
  Dio get dio => _getDio();
  DioClient();

  Dio _getDio() {
    Dio dio = Dio();

    return dio;
  }
}
