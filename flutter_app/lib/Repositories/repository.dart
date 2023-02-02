import 'dart:convert';
import 'package:flutter_app/Model/ativo.dart';

import '../Services/interface/iservice_web_request.dart';
import '../Services/service_web_request.dart';
import 'interface/irepository.dart';

class Repository implements IRepository {
  final IServiceWebRequest _iServiceWebRequest = const ServiceWebHttp();

  @override
  Future<Ativo> getAtivo(String symbol) async {
    final response =
        await _iServiceWebRequest.get(server + symbol, headers: {});
    return Ativo.fromJson(
        json.decode(response.body)['chart']['result'][0] as Map);
  }
}
