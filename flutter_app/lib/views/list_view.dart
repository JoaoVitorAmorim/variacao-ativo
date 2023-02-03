import 'package:flutter/material.dart';
import 'package:flutter_app/views/form_view.dart';

class AtivosListView extends StatefulWidget {
  const AtivosListView({super.key});

  @override
  State<AtivosListView> createState() => _AtivosListViewState();
}

class _AtivosListViewState extends State<AtivosListView> {
  static List<String> ativos = [
    '^DJI',
    '^IXIC',
    '^RUT',
    '^DJI',
    '^DJI',
    '^DJI',
    '^DJI',
    '^DJI',
    '^DJI',
    '^DJI'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          for (String ativo in ativos) ativoCardFactory(context, ativo),
        ],
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
