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

    if (kIsWeb) {
      response = await http.get(Uri.parse(url), headers: headers);
    } else {
      response = await Isolate.run<http.Response>(
          () => http.get(Uri.parse(url), headers: headers));
    }

    return ServiceWebResponse(
        statusCode: response.statusCode,
        body: response.body,
        headers: response.headers);
  }

  @override
  Future<IServiceWebResponse> post(String url,
      {Object? body, Map<String, String>? headers, Encoding? encoding}) async {
    late final http.Response response;

    if (kIsWeb) {
      response = await http.post(Uri.parse(url),
          headers: headers, body: body, encoding: encoding);
    } else {
      response = await Isolate.run<http.Response>(
        () => http.post(Uri.parse(url),
            headers: headers, body: body, encoding: encoding),
      );
    }

    return ServiceWebResponse(
        statusCode: response.statusCode,
        body: response.body,
        headers: response.headers);
  }

  @override
  Future<IServiceWebResponse> delete(String url,
      {Object? body, Map<String, String>? headers, Encoding? encoding}) async {
    late final http.Response response;

    if (kIsWeb) {
      response = await http.delete(Uri.parse(url),
          headers: headers, body: body, encoding: encoding);
    } else {
      response = await Isolate.run<http.Response>(
        () => http.delete(Uri.parse(url),
            headers: headers, body: body, encoding: encoding),
      );
    }

    return ServiceWebResponse(
        statusCode: response.statusCode,
        body: response.body,
        headers: response.headers);
  }

  @override
  Future<IServiceWebResponse> put(String url,
      {Object? body, Map<String, String>? headers, Encoding? encoding}) async {
    late final http.Response response;

    if (kIsWeb) {
      response = await http.put(Uri.parse(url),
          headers: headers, body: body, encoding: encoding);
    } else {
      response = await Isolate.run<http.Response>(
        () => http.put(Uri.parse(url),
            headers: headers, body: body, encoding: encoding),
      );
    }

    return ServiceWebResponse(
        statusCode: response.statusCode,
        body: response.body,
        headers: response.headers);
  }
}
