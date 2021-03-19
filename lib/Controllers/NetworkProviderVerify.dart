import 'package:flutter/material.dart';
import '../Screens/DataTopup.dart';
import 'package:get/get.dart';

class NetworkVerify extends GetxController {

  Rx phoneNo;
  RxString labelText = 'Phone No'.obs;
  String selectedCurrency ='MTN';
  Rx<AssetImage> networks = AssetImage('images/MTNN.jpg').obs;

  void verifyNetwork(phoneNo){
    if(phoneNo == '0703' || phoneNo == '0706' || phoneNo == '0803' ||phoneNo == '0806' || phoneNo == '0810' || phoneNo == '0813' ||
        phoneNo == '0814' || phoneNo == '0816' || phoneNo == '0903' || phoneNo == '0906'){
      labelText.value = 'This is a MTN Number';
      selectedCurrency = 'MTN';
      networks.value = AssetImage('images/MTNN.jpg');

    }
    else if(phoneNo == '0701' || phoneNo == '0708' || phoneNo == '0802' || phoneNo == '0808' ||phoneNo == '0812' || phoneNo == '0902' ||
        phoneNo == '0907' || phoneNo == '0901'){
      labelText.value = 'This is an AIRTEL Number';
      selectedCurrency = 'AIRTEL';
      networks.value = AssetImage('images/Airtel.png');
    }
    else if(phoneNo == '0705' || phoneNo == '0805' || phoneNo == '0807' || phoneNo == '0811' || phoneNo == '0815' || phoneNo == '0905'){
      labelText.value = 'This is a GLO Number';
      selectedCurrency = 'GLO';
      networks.value = AssetImage('images/GLO.jpg');
    }
    else if(phoneNo == '0809' || phoneNo == '0817' || phoneNo == '0818' || phoneNo == '0908' || phoneNo == '0909'){
      labelText.value = 'This is a 9mobile Number';
      selectedCurrency = '9MOBILE';
      networks.value = AssetImage('images/9mobile.jpg');

    }
    else{
      labelText.value = 'Phone Number';
    }
  }

}



