import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybetter/Controllers/NetworkProviderVerify.dart';
import 'package:mybetter/Controllers/ProductController.dart';

const List<String> BroadbandDrop  = [
  'SMILE',
  'SPECT-RANET',
  'SWIFT',
];

const List<String> BroadbandDropApi  = [
  'Smile 35GB Anytime',
  ' Smile UnlimitedPlatinum',
  ' Smile 3GB MidNite',
  ' Smile 3GB Weekend ONLY',
  ' Smile 5GB Bigga',
  ' Smile 6.5GB Bigga',
  ' SmileVoice ONLY 430',
  ' Smile 8GB Bigga',
  ' Smile 10GB Bigga',
  ' Smile 12GB Bigga',
  ' Smile 15GB Bigga',
  ' Smile 15GB Anytime',
  ' Smile UnlimitedPremium',
  ' Smile 20GB Bigga',
  ' Smile 30GB Bigga',
  ' Smile 40GB Bigga',
  ' Smile 60GB Bigga',
  ' Smile Unlimited Lite',
  ' Smile 75GB Bigga',
  ' Smile 50GB Bumpa Value',
  ' Smile 400GB Anytime',
  ' Smile 100GB Bigga',
  ' Smile Unlimited Essential',
  ' Smile 3GB Bigga',
  ' Smile 6GB FlexiWeekly',
  ' Smile 2GB Bigga',
  ' Smile 2GB MidNite',
  ' Smile 2GB Flexi Weekly',
  ' SmileVoice ONLY 135',
  ' Smile 200GB Anytime',
  ' Smile 100GB Bumpa Value',
  ' Smile 90GB Anytime',
  ' Smile 80GB Bumpa Value',
  ' Smile 1.5GB Bigga',
  ' SmileVoice ONLY 65',
  ' Smile 1GB Flexi Weekly',
  ' Smile 1GB Flexi',
  ' Smile 2.5GB Flexi',
];
RxString amount = '2000'.obs;


NetworkVerify networkVerify = Get.put(NetworkVerify());

List<DropdownMenuItem> getBroadbandDropdown(){
  List<DropdownMenuItem<String>> providersDropDown = [];
  for(String broadbandProvider in BroadbandDrop){

    var newProvider = DropdownMenuItem(
        child: Text(broadbandProvider),
    value:broadbandProvider,
      onTap: (){
          if(broadbandProvider == BroadbandDrop[0]){
            networkVerify.networks.value = AssetImage('images/MTNN.jpg');
            amount.value = '3000';

          }
          else if(broadbandProvider == BroadbandDrop[1]){
            networkVerify.networks.value = AssetImage('images/GLO.jpg');
          }
          else
            networkVerify.networks.value = AssetImage('images/Airtel.png');
         }

    );

    providersDropDown.add(newProvider);
  }
  return providersDropDown;
}

List<DropdownMenuItem> getBroadbandPlansDropdown(){
  List<DropdownMenuItem<String>> providersDropDown = [];
  for(String broadbandProvider in BroadbandDropApi){

    var newProvider = DropdownMenuItem(
        child: Text(broadbandProvider),
        value:broadbandProvider,
        onTap: (){
          if(broadbandProvider == BroadbandDropApi[0]){
            networkVerify.networks.value = AssetImage('images/MTNN.jpg');
            amount.value = '3000';

          }
          else if(broadbandProvider == BroadbandDrop[1]){
            networkVerify.networks.value = AssetImage('images/GLO.jpg');
          }
          else
            networkVerify.networks.value = AssetImage('images/Airtel.png');
        }

    );

    providersDropDown.add(newProvider);
  }
  return providersDropDown;
}