import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mybetter/Constants.dart';
import 'package:mybetter/Controllers/TransactionController.dart';
import 'package:mybetter/Screens/BroadbandTopUp.dart';
import 'package:mybetter/Screens/DataTopup.dart';
import 'package:mybetter/Screens/Prodd.dart';
import 'package:mybetter/Utilities/BalanceBoard.dart';
import 'Utilities/Rounded Button.dart';
import 'Utilities/Provider Card.dart';
import 'Controllers/ProviderBorderFocus.dart';
import 'package:clay_containers/clay_containers.dart';



class Home extends StatelessWidget {
  static const String id = 'Home';

  TransactionController transactionController = Get.put(TransactionController());


  bool switchColor=true;
  var homeBut = kLeadingGradient;
  var historyBut = Colors.white;


  var walletBal = 13000.obs;

  var count = 'white'.obs;

  void changeColor() {
    count.value = count.value.toUpperCase();
  }


  // SizedBox(
  // height: 20,
  // ),
  //
  // Row(
  // children: [
  // Text('Wallet Bal: #$walletBal',
  // style: Theme.of(context).textTheme.bodyText1.copyWith(
  // fontSize: 17,
  // color: Colors.white
  // ),)
  // ],
  // ),
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            height: 60,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kLeadingGradient, Color(0xFF741C56)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),

                  ],
                ),


              ],
            ),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [

            ClipRect(
              child: FractionallySizedBox(
                heightFactor: 0.35,
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Account Overview',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),

                      UserBalanceCard()
                    ],
                  ),
                ),
              ),
            ),


            FractionallySizedBox(
              heightFactor: 0.65,
              alignment: Alignment.bottomCenter,
              child: ListView(
                children: [
                  Container(
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
                                        focusedBorderAD(1);
                                        Get.to(()=> Prodd());
                                        },),),

                                  Expanded(
                                    child: ProviderCard(
                                      color: providerCardClickData, focus: focusBorderWidth,icon: Icons.router_rounded, text: 'Mobile Internet Data',
                                      onpress: () {
                                          focusedBorderAD(2);
                                          Get.to(() => DataTopUp());
                                          },
                                    ),),

                                  Expanded(
                                    child: ProviderCard(
                                      color: providerCardClickData, focus: focusBorderWidth,icon: Icons.wifi_rounded, text: 'Broadband Internet Data',
                                      onpress: () {
                                        focusedBorderAD(2);
                                        Get.to(() => BroadbandTopUp());
                                      },
                                    ),),


                                ],
                              ),
                            ),


                            UtilityTag(utilityTitle: 'Utility Bills',),

                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              child: Row(
                                  children: [
                                    Expanded(
                                      child: ProviderCard(
                                        color: providerCardClickSpectranet, focus: focusBorderWidth, icon: Icons.live_tv, text: 'Cable Tv',
                                        onpress: () {
                                          focusedBorderBDT(1);
                                        },),),

                                    Expanded(
                                      child: ProviderCard(
                                        color: providerCardClickSmile, focus: focusBorderWidth, icon: Icons.electrical_services_sharp, text: 'Electricity',
                                        onpress: () {

                                          focusedBorderBDT(2);
                                        },),),

                                    Expanded(
                                      child: ProviderCard(
                                        color: providerCardClickSwift, focus: focusBorderWidth, icon: Icons.book, text: 'WAEC Result',
                                        onpress: () {

                                          focusedBorderBDT(3);
                                        },),),



                                  ]
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),




                ],
              ),
            ),


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
      child: Text(
        utilityTitle,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
          fontWeight: FontWeight.bold,
          fontFamily: 'Source Sans Pro',
          fontSize: 15
        )
        ),

    );

  }

}

// FractionallySizedBox(
// heightFactor: 0.1,
// alignment: Alignment.topCenter,
// child: Container(
// padding: EdgeInsets.symmetric(vertical: 1,horizontal: 1),
// margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
// decoration: BoxDecoration(
// border: Border.all(color: kLeadingGradient, width: 1, style: BorderStyle.solid),
// borderRadius: BorderRadius.circular(25)
// ),
// child: Row(
// children: [
// Expanded(
// child: Obx(() => InkWell(
// onDoubleTap: (){
// changeColor();
// },
// child: Container(
// decoration: BoxDecoration(
// color: homeBut,
// border: Border.all(color: kLeadingGradient, width: 1, style: BorderStyle.solid),
// borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
// ),
// child: Center(child: Text('Home ${count.value}',
// style: Theme.of(context).textTheme.button.copyWith(
// color: Colors.black
// ),)),
// ),
// ),
// ), ),
//
// Expanded(
// child: Obx(() => InkWell(
// onTap: (){
// Get.bottomSheet(
// bottomSheet(),
// ena
// )
// ],
// )
// ),
// ),
// bleDrag: true
// );
// },
// child:Container(
// decoration: BoxDecoration(
// color: historyBut,
// borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
// ),
// child: Center(child: Text('History ${count.value}',
// style: Theme.of(context).textTheme.button.copyWith(
// color: Colors.black
// ),)),
// ),
// ),),