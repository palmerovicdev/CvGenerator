import 'package:dio/dio.dart';

class ConnectionHelper {

  ConnectionHelper({required this.baseUrl, required this.contentType}){
   setBaseUrl(baseUrl);
   setContentType(contentType);
  }

  final String baseUrl;
  final String contentType;

  final dio = Dio();

  void setBaseUrl(String url) {
    dio.options.baseUrl = url;
  }

  void setContentType(String contentType) {
    dio.options.contentType = contentType;
  }
}