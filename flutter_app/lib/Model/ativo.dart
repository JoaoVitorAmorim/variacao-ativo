// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

class Ativo {
  final String? currency;
  final String? regularMarketPrice;
  final String? previousClose;
  final String symbol;
  final List<double>? open;
  final List<double>? close;
  final List<double>? high;
  final List<double>? low;

  Ativo({
    required this.symbol,
    this.high,
    this.low,
    this.previousClose,
    this.currency,
    this.regularMarketPrice,
    this.open,
    this.close,
  }) : super();

  factory Ativo.fromJson(Map<dynamic, dynamic> json) {
    List<double> _open = [];
    List<double> _close = [];
    List<double> _high = [];
    List<double> _low = [];
    final len = (json['indicators']['quote'][0]['open'] as List).length;
    for (int i = 0; i < len; i++) {
      _open.add(json['indicators']['quote'][0]['open'][i] ?? 0);
      _close.add(json['indicators']['quote'][0]['close'][i] ?? 0);
      _high.add(json['indicators']['quote'][0]['high'][i] ?? 0);
      _low.add(json['indicators']['quote'][0]['low'][i] ?? 0);
    }

    return Ativo(
      symbol: json['meta']['symbol'],
      regularMarketPrice: json['meta']['regularMarketPrice'].toString(),
      previousClose: json['meta']['previousClose'].toString(),
      open: _open,
      close: _close,
      high: _high,
      low: _low,
    );
  }
}
