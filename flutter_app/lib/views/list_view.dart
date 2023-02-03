import 'package:flutter/material.dart';
import 'package:flutter_app/views/form_view.dart';

class AtivosListView extends StatefulWidget {
  const AtivosListView({super.key});

  @override
  State<AtivosListView> createState() => _AtivosListViewState();
}

class _AtivosListViewState extends State<AtivosListView> {
  static List<String> ativos = [
    'TSLA',
    'GOOG',
    'META',
    'BTC-USD',
    'AMZN',
    'AAPL',
    'NFLX',
    'AMC',
    '^DJI'
  ];

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Center(
              child: Text(
            'PESQUISAR ATIVO',
            style: TextStyle(fontSize: 20),
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: SizedBox(
                width: 200,
                child: TextFormField(
                  controller: controller,
                  onFieldSubmitted: (_) => {pushFormView(context)},
                ),
              ),
            ),
          ),
          for (String ativo in ativos) ativoCardFactory(context, ativo),
        ],
      ),
    );
  }

  Future<dynamic> pushFormView(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormView(
          symbol: controller.text,
        ),
      ),
    );
  }

  Widget ativoCardFactory(BuildContext context, String symbol) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: SizedBox(
          width: 220,
          height: 70,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white70),
            ),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormView(
                    symbol: symbol,
                  ),
                ),
              )
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      symbol,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black26),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
