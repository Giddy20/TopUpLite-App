import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybetter/Controllers/ProductController.dart';
import 'package:mybetter/Utilities/TxnHisBottomSheet.dart';

import '../Constants.dart';

class UserBalanceCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClayContainer(
        color: Color(0xFFd9dde2),
        borderRadius: 10,
        curveType: CurveType.concave,
        spread:1,
        depth: 15,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('₦7950.00',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.black
                    ),),

                  SizedBox(height: 10,),

                  Text('Wallet Balance',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontFamily: 'Source Sans Pro',
                        color: Colors.black45
                    ),),
                ],
              ),

              Column(
                children: [
                  InkWell(
                    onTap: (){
                      Get.bottomSheet(
                          TxnHistoryBottomSheet(),);
                    },
                    child: ClayContainer(
                      color: kLeadingGradient,
                      height: 32,
                      width: 32,
                      borderRadius: 200,
                      emboss:true,
                      curveType: CurveType.concave,
                      spread: 1,
                      depth: 50,
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  Text('Add Money',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontFamily: 'Source Sans Pro',
                        color: Colors.black45
                    ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
