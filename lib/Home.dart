import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mybetter/Constants.dart';
import 'package:mybetter/Screens/DataTopup.dart';
import 'Utilities/Rounded Button.dart';
import 'Utilities/Provider Card.dart';
import 'Controllers/ProviderBorderFocus.dart';

class Home extends StatefulWidget {
  static const String id = 'Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          height: 160,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [kLeadingGradient, Color(0xFF741C56)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  RoundButton(
                    icon: Icon(
                      Icons.phone_iphone_rounded,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Top up Lite',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            UtilityTag(utilityTitle: 'Airtime And Data',),

            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: ProviderCard(
                          color: providerCardClickAirtime, focus: focusBorderWidth, icon: Icons.phone_android_outlined, text: 'Airtime',
                          onpress: () {
                            setState(() {
                              focusedBorderAD(1);
                            });},),),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: ProviderCard(
                          color: providerCardClickData, focus: focusBorderWidth,icon: Icons.router_rounded, text: 'Data Top up',
                          onpress: () {
                            setState(() {
                              focusedBorderAD(2);
                              Navigator.pushNamed(context, DataTopUp.id);
                            });},),),
                    ],
                  ),
                ),

                UtilityTag(utilityTitle: 'Broadband Internet Topup',),

        Container(
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    child: Row(
    children: [
      Expanded(
        child: ProviderCard(
          color: providerCardClickSpectranet, focus: focusBorderWidth, icon: Icons.wifi_sharp, text: 'Spectranet',
          onpress: () {
            setState(() {
              focusedBorderBDT(1);
            });},),),

      Expanded(
        child: ProviderCard(
          color: providerCardClickSmile, focus: focusBorderWidth, icon: Icons.network_wifi, text: 'Smile',
          onpress: () {
            setState(() {
              focusedBorderBDT(2);
            });},),),

      Expanded(
        child: ProviderCard(
          color: providerCardClickSwift, focus: focusBorderWidth, icon: Icons.wifi_protected_setup_outlined, text: 'Swift',
          onpress: () {
            setState(() {
              focusedBorderBDT(3);
            });},),),

    ]
    ),
        ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UtilityTag extends StatelessWidget {

  final String utilityTitle;

  UtilityTag({this.utilityTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 25),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kLeadingGradient, Color(0xFF741C56)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Text(
        utilityTitle,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w200,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
