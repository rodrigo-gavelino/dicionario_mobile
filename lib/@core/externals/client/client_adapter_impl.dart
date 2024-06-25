import 'dart:convert';
import 'dart:io';

import 'package:dicionario_mobile/@core/externals/client/client_adapter.dart';
import 'package:dicionario_mobile/@core/externals/client/response.dart';

class ClientAdapterImpl implements ClientAdapter {
  final HttpClient _httpClient;

  ClientAdapterImpl({required HttpClient httpClient})
      : _httpClient = httpClient;

  @override
  Future<Response> get(String url) async {
    try {
      final request = await _httpClient.getUrl(Uri.parse(url));
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      return Response(
        statusCode: response.statusCode,
        body: body,
      );
    } catch (e) {
      throw HttpException(
        e.toString(),
        uri: Uri.parse(url),
      );
    }
  }

  @override
  Future<Response> delete(String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Response> post(String url, body) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Response> put(String url, body) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
