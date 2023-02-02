import '../../Model/ativo.dart';

const String server = 'https://query2.finance.yahoo.com/v8/finance/chart/';

abstract class IRepository {
  Future<Ativo> getAtivo(final String symbol);
}
