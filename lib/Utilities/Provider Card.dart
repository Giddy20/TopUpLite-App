import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybetter/Constants.dart';


class ProviderCard extends StatelessWidget {
  final Color color;
  final double focus;
  final Function onpress;
  final IconData icon;
  final String text;

  ProviderCard({this.color, this.onpress, this.focus, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onpress,
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
            width: MediaQuery.of(context).size.width*0.4,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.transparent, width: 0, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: kLeadingGradient,
                  size: 35,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kLeadingGradient,
                    fontFamily: 'Source Sans Pro',

                  ),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}