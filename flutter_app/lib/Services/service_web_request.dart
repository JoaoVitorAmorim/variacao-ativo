import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'interface/iservice_web_request.dart';
import 'interface/iservice_web_response.dart';
import 'service_web_response.dart';

class ServiceWebHttp implements IServiceWebRequest {
  const ServiceWebHttp();

  @override
  Future<IServiceWebResponse> get(String url,
      {Map<String, String>? headers}) async {
    late final http.Response response;

    response = await http.get(Uri.parse(url), headers: headers);
    () => http.get(Uri.parse(url), headers: headers);

    return ServiceWebResponse(
        statusCode: response.statusCode,
        body: response.body,
        headers: response.headers);
  }
}
