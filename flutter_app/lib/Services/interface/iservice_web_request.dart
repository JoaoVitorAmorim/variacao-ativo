import 'iservice_web_response.dart';

abstract class IServiceWebRequest {
  const IServiceWebRequest();

  Future<IServiceWebResponse> get(String url, {Map<String, String>? headers});
}
