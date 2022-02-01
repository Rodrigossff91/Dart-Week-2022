import 'package:get/get_connect.dart';

class RestClient extends GetConnect {
  String _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';
  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String messsage;
  RestClientException({
    this.code,
    required this.messsage,
  });

  @override
  String toString() => 'RestClientException(code: $code, messsage: $messsage)';
}
