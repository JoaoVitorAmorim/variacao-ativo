class Ativo {
  final String? currency;
  final String? regularMarketPrice;
  final String? previousClose;
  final String symbol;
  final List<int>? open;
  final List<int>? close;

  Ativo({
    required this.symbol,
    this.previousClose,
    this.currency,
    this.regularMarketPrice,
    this.open,
    this.close,
  }) : super();

  factory Ativo.fromJson(Map<dynamic, dynamic> json) {
    return Ativo(
        symbol: json['symbol'],
        regularMarketPrice: json['regularMarketPrice'].toString(),
        previousClose: json['previousClose'].toString());
  }
}
