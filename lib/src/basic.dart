import 'package:flutter/material.dart';
import 'package:numpads/src/models/button_settings_model.dart';

class BasicNumpad extends StatelessWidget {
  final TextEditingController controller;
  ButtonSettings? buttonSettings;
  BasicNumpad({Key? key, required this.controller, this.buttonSettings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [normal('1'), normal('2'), normal('3')],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [normal('4'), normal('5'), normal('6')],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [normal('7'), normal('8'), normal('9')],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonSettings?.showResetButton ?? false
                    ? const SizedBox(
                        height: 0,
                      )
                    : normal('C', function: () {
                        controller.clear();
                      }),
                normal('0'),
                buttonSettings?.showDeleteIcon ?? false
                    ? const SizedBox(
                        height: 0,
                      )
                    : normal(buttonSettings?.deleteIcon ?? Icons.delete_outline, function: () {
                        print(controller.text);
                      })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget normal(text, {Function? function}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (function != null) {
            function();
          } else {
            controller.text += text.toString();
          }
        },
        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonSettings?.radius ?? 10)),
            color: buttonSettings?.buttonColor ?? Colors.blue.shade300,
            child: Center(child: text.runtimeType == String ? Text(text) : Icon(text))),
      ),
    );
  }
}
