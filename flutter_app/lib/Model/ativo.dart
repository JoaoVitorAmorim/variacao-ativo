// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:ffi';

import 'package:candlesticks/candlesticks.dart';

class Ativo {
  final String? currency;
  final String? regularMarketPrice;
  final String? previousClose;
  final String symbol;
  final List<double>? open;
  final List<double>? close;
  final List<double>? high;
  final List<double>? low;
  final List<int>? volume;
  final List<int>? timeStramp;
  final List<Candle>? candle;

  Ativo({
    required this.symbol,
    this.timeStramp,
    this.volume,
    this.high,
    this.low,
    this.previousClose,
    this.currency,
    this.regularMarketPrice,
    this.open,
    this.close,
    this.candle,
  }) : super();

  factory Ativo.fromJson(Map<dynamic, dynamic> json) {
    final candle = Candle(
        date: DateTime.now(),
        open: 1780.36,
        high: 1873.93,
        low: 1755.34,
        close: 1848.56,
        volume: 0);
    List<double> _open = [];
    List<double> _close = [];
    List<double> _high = [];
    List<double> _low = [];
    List<int> _volume = [];
    List<int> _timeStamp = [];
    List<Candle> _candle = [];
    final len = (json['indicators']['quote'][0]['open'] as List).length;
    for (int i = 0; i < len; i++) {
      _open.add(json['indicators']['quote'][0]['open'][i] ?? 0);
      _close.add(json['indicators']['quote'][0]['close'][i] ?? 0);
      _high.add(json['indicators']['quote'][0]['high'][i] ?? 0);
      _low.add(json['indicators']['quote'][0]['low'][i] ?? 0);
      _volume.add(json['indicators']['quote'][0]['volume'][i] ?? 0);
      _timeStamp.add(
        json['timestamp'][i] ?? 0,
      );
      _candle.add(
        Candle(
          date: DateTime(_timeStamp[i]),
          high: _high[i],
          low: _low[i],
          open: _open[i],
          close: _close[i],
          volume: double.tryParse(_volume[i].toString()) ?? 0,
        ),
      );
    }

    return Ativo(
      symbol: json['meta']['symbol'],
      regularMarketPrice: json['meta']['regularMarketPrice'].toString(),
      previousClose: json['meta']['previousClose'].toString(),
      open: _open,
      close: _close,
      high: _high,
      low: _low,
      volume: _volume,
      timeStramp: _timeStamp,
      candle: _candle,
    );
  }
}
