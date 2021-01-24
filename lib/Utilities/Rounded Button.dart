import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Function onpress;
  final Widget icon;

  RoundButton({this.onpress, this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      shape: CircleBorder(),
      elevation: 6,
      fillColor: Color(0X90757575),
      constraints: BoxConstraints.tightFor(
        height: 48,
        width: 48,
      ),
      child: icon,
    );
  }
}