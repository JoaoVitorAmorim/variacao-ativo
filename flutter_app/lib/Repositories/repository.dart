import 'dart:convert';
import '../Services/interface/iservice_web_request.dart';
import '../Services/service_web_request.dart';
import 'interface/irepository.dart';

class Repository implements IRepository {
  final IServiceWebRequest _iServiceWebRequest = const ServiceWebHttp();
}
