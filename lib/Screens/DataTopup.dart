import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mybetter/Controllers/TransactionController.dart';
import 'package:mybetter/Home.dart';
import 'package:mybetter/Models/Transactions.dart';
import '../Utilities/Rounded Button.dart';
import 'package:mybetter/Constants.dart';
import '../Controllers/NetworkProviderVerify.dart';


class DataTopUp extends StatelessWidget {
  static const String id = 'DataTopUp';

  NetworkVerify networkVerify = Get.put(NetworkVerify());
  TransactionController transactionController = Get.put(TransactionController());

  var formKey = GlobalKey<FormState>();
  var autoValidate = false;

  String phoneNo;
  Rx<AssetImage> networks = AssetImage('images/MTNN.jpg').obs;
  String selectedCurrency = 'MTN';
  var savedText = 'd';
  var savedAmount = 'd';


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
                      Icons.router_rounded,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Mobile Data',
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
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey,
              autovalidate: autoValidate,

              child: Column(
                children: [
                  Obx(()=> TextFormField(
                      onSaved: (value) {
                        savedText = value;
                        print(savedText);
                      },
                      onChanged: (value){
                        print(value);
                        phoneNo = value;
                        if (phoneNo.length <= 4){
                          networkVerify.verifyNetwork(phoneNo);
                        }


                      },
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                      value.trim().isEmpty ? 'Input Phone number' : null,
                      style: TextStyle(
                        fontSize: 17,
                      ),


                      decoration: kInvestmentInputDecoration.copyWith(
                        icon: Icon(
                          Icons.phone,
                          color: kLeadingGradient,
                          size: 27,
                        ),
                        suffixIcon: Icon(
                          Icons.contact_phone_outlined,
                          color: kLeadingGradient,
                          size: 27,
                        ),
                        labelText: networkVerify.labelText.value,
                        labelStyle: TextStyle(
                            color: Colors.grey,
                          fontFamily: 'Source Sans Pro'
                        ),
                      ),
                  ),),


                  TextFormField(
                    onSaved: (value) {
                      savedAmount = value;
                    },
                    onChanged: (value){
                      print(value);


                    },
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                    value.trim().isEmpty ? 'Input Amount' : null,
                    style: TextStyle(
                      fontSize: 17,
                    ),


                    decoration: kInvestmentInputDecoration.copyWith(
                      icon: Icon(
                        Icons.money,
                        color: kLeadingGradient,
                        size: 27,
                      ),

                      labelText: 'Amount',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Source Sans Pro'
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Obx(() => Image(image: networkVerify.networks.value,
                        height: 35,),),

                      SizedBox(
                        width: 15,
                      ),

                      Container(
                        child: Expanded(
                          child: DropdownButton(
                              isExpanded: true,
                              value: selectedCurrency,
                              iconEnabledColor: kLeadingGradient,
                              hint: Text(selectedCurrency),
                              items: [
                                DropdownMenuItem(
                                  child: Text('MTN'),
                                  value: 'MTN',
                                  onTap: (){networkVerify.networks.value = AssetImage('images/MTNN.jpg');},),
                                DropdownMenuItem(
                                  child: Text('AIRTEL'),
                                  value: 'AIRTEL',
                                  onTap: (){networkVerify.networks.value = AssetImage('images/Airtel.png');},),
                                DropdownMenuItem(
                                  child: Text('GLO'),
                                  value: 'GLO',
                                  onTap: (){networkVerify.networks.value = AssetImage('images/GLO.jpg');},),
                                DropdownMenuItem(
                                  child: Text('9MOBILE',
                                  ),
                                  value: '9MOBILE',
                                  onTap: (){networkVerify.networks.value = AssetImage('images/9mobile.jpg');},)
                              ],
                              onChanged: (value){
                                  selectedCurrency = value;
                                  print(value);
                              }),
                        ),
                      ),
                    ],
                  ),

                  MaterialButton(
                    onPressed: (){
                      validateInputs();
                      print('ddd');
                    },
                    elevation: 9,
                    child: ClayContainer(
                      color: kLeadingGradient,
                      borderRadius: 15,
                      emboss: true,
                      curveType: CurveType.concave,
                      spread: 1,
                      depth: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Buy Data',
                          style: Theme.of(context).textTheme.button.copyWith(
                            fontFamily: 'Source Sans Pro',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),


          ),
        ],
      ),



    );
  }
  void validateInputs() {
    var formState = formKey.currentState;
    if (!formState.validate()) {
      autoValidate = true;
    }


    formState.save();
    processTxn();
  }

  void  processTxn(){
    var dt = DateTime.now();

    transactionController.transactions.add(
        Transactions(title: '${selectedCurrency} Airtime',amount: int.parse(savedAmount), dateTime: DateFormat.yMMMEd().format(dt)),
    );
  }
}



