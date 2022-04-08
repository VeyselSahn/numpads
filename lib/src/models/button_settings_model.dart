import 'package:flutter/cupertino.dart';

class ButtonSettings {
  double? radius;
  bool? showResetButton;
  bool? showDeleteIcon;
  IconData? deleteIcon;
  Color? buttonColor;

  ButtonSettings({this.buttonColor, this.radius, this.deleteIcon, this.showDeleteIcon, this.showResetButton});
}
