import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/BLoC/ativo_bloc.dart';
import 'package:flutter_app/Model/ativo.dart';
import 'package:flutter_app/views/error_view.dart';
import 'package:flutter_app/views/widgets/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_chart/interactive_chart.dart';

class FormView extends StatefulWidget {
  final String symbol;
  const FormView({
    super.key,
    required this.symbol,
  });

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  @override
  void initState() {
    AtivoBloc.instance.add(GetInfo(symbol: widget.symbol));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AtivoBloc, AtivoState>(
        bloc: AtivoBloc.instance,
        builder: (context, state) {
          switch (state.runtimeType) {
            case Success:
              final ativo = (state as Success).ativo;
              final variation =
                  (ativo.regularMarketPrice! - ativo.previousClose!);
              final percentage = 100 -
                  (ativo.previousClose! * 100 / ativo.regularMarketPrice!)
                      .ceilToDouble();
              return ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Item(
                    label: 'Symbol',
                    label2: ativo.symbol,
                    iconData: Icons.maps_home_work_outlined,
                    color: Colors.amber,
                  ),
                  linhazinhaMarota(),
                  Item(
                    label: 'Valor de Mercado',
                    label2: 'R\$ ${ativo.regularMarketPrice!.toString()}',
                    iconData: Icons.monetization_on_rounded,
                    color: Colors.green,
                  ),
                  linhazinhaMarota(),
                  Item(
                      label: 'Fechameto Anterior',
                      label2: 'R\$ ${ativo.previousClose!.toString()}',
                      iconData: Icons.cases_rounded,
                      color: Colors.orange),
                  linhazinhaMarota(),
                  Item(
                    label: 'Variacao',
                    label2: 'R\$ ${variation.ceilToDouble()}',
                    iconData: variation > 0
                        ? Icons.arrow_drop_up_sharp
                        : Icons.arrow_drop_down_sharp,
                    color: variation > 0 ? Colors.green : Colors.red,
                  ),
                  linhazinhaMarota(),
                  Item(
                    label: 'Percentual',
                    label2: '$percentage %',
                    iconData: Icons.percent,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  graphs(context, ativo),
                ],
              );
            case Error:
              return const ErrorView();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Padding graphs(BuildContext context, Ativo ativo) {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0, right: 45.0, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(),
                  body: InteractiveChart(candles: ativo.candleData!),
                ),
              ),
            ),
            child: const SizedBox(
                width: 60,
                height: 80,
                child: Icon(Icons.candlestick_chart_rounded)),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(),
                  body: Candlesticks(candles: ativo.candle!),
                ),
              ),
            ),
            child: const SizedBox(
                width: 60,
                height: 80,
                child: Icon(Icons.candlestick_chart_outlined)),
          ),
        ],
      ),
    );
  }

  Widget linhazinhaMarota() => const Center(
        child: SizedBox(
          width: 180,
          child: Divider(
            thickness: 1.5,
          ),
        ),
      );
}
