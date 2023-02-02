const String server = 'https://dev-eab.wattio.com.br';

enum Routes {
  delete('$server/delete'),
  put('$server/put'),
  get('$server/api/v4/search'),
  post('$server/get'),
  login('$server/api/v4/user');

  const Routes(this.url);
  final String url;
}

abstract class IRepository {
  // Future<Pregao> getPregao(final String token);
}
