import 'package:flutter/material.dart';
import 'package:flutter_app/BLoC/ativo_bloc.dart';
import 'package:flutter_app/views/error_view.dart';
import 'package:flutter_app/views/widgets/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(title: Text(widget.symbol)),
      body: BlocBuilder<AtivoBloc, AtivoState>(
        bloc: AtivoBloc.instance,
        builder: (context, state) {
          switch (state.runtimeType) {
            case Success:
              final ativo = (state as Success).ativo;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Item(
                    label: 'Symbol',
                    label2: ativo.symbol,
                    iconData: Icons.maps_home_work_outlined,
                  ),
                  linhazinhaMarota(),
                  Item(
                    label: 'Valor de Mercado',
                    label2: 'R\$ ${ativo.regularMarketPrice!}',
                    iconData: Icons.monetization_on_rounded,
                  ),
                  linhazinhaMarota(),
                  Item(
                    label: 'Fechameto Anterior',
                    label2: 'R\$ ${ativo.previousClose!}',
                    iconData: Icons.auto_graph_rounded,
                  )
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

  SizedBox linhazinhaMarota() => const SizedBox(
        width: 300,
        child: Divider(
          thickness: 1.5,
        ),
      );
}
