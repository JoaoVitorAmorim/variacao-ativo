import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final String label, label2;
  final IconData iconData;

  const Item({
    required this.label,
    required this.label2,
    required this.iconData,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 343,
        height: 80,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        widget.iconData,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          widget.label,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      Text(
                        widget.label2,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
