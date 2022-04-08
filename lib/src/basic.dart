import 'package:flutter/cupertino.dart';

class BasicNumpad extends StatelessWidget {
  const BasicNumpad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: List.generate(
            items.length,
            (index) => Center(
                  child: Text(items.elementAt(index).toString()),
                )));
  }
}

const List items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 'C', 0, '->'];
