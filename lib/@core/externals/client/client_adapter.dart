import 'package:dicionario_mobile/@core/externals/client/response.dart';

abstract interface class ClientAdapter {
  Future<Response> get(String url);
  Future<Response> post(String url, dynamic body);
  Future<Response> put(String url, dynamic body);
  Future<Response> delete(String url);
}
