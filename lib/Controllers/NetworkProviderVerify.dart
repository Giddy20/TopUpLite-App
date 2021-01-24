import 'package:flutter/material.dart';
import '../Screens/DataTopup.dart';

var phoneNo;
String labelText = 'Phone No';
String selectedCurrency ='MTN';
AssetImage networks = AssetImage('images/MTNN.jpg');

void verifyNetwork(){
  if(phoneNo == '0703' || phoneNo == '0706' || phoneNo == '0803' ||phoneNo == '0806' || phoneNo == '0810' || phoneNo == '0813' ||
      phoneNo == '0814' || phoneNo == '0816' || phoneNo == '0903' || phoneNo == '0906'){
    labelText = 'This is a MTN Number';
    selectedCurrency = 'MTN';
    networks = AssetImage('images/MTNN.jpg');

  }
  else if(phoneNo == '0701' || phoneNo == '0708' || phoneNo == '0802' || phoneNo == '0808' ||phoneNo == '0812' || phoneNo == '0902' ||
      phoneNo == '0907' || phoneNo == '0901'){
    labelText = 'This is an AIRTEL Number';
    selectedCurrency = 'AIRTEL';
    networks = AssetImage('images/Airtel.png');

  }
  else if(phoneNo == '0705' || phoneNo == '0805' || phoneNo == '0807' || phoneNo == '0811' || phoneNo == '0815' || phoneNo == '0905'){
    labelText = 'This is a GLO Number';
    selectedCurrency = 'GLO';
    networks = AssetImage('images/GLO.jpg');
  }
  else if(phoneNo == '0809' || phoneNo == '0817' || phoneNo == '0818' || phoneNo == '0908' || phoneNo == '0909'){
    labelText = 'This is a 9mobile Number';
    selectedCurrency = '9MOBILE';
    networks = AssetImage('images/9mobile.jpg');

  }
  else{
    labelText = 'Phone Number';
  }
}