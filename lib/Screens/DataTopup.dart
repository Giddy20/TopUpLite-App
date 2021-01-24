import 'package:flutter/material.dart';
import '../Utilities/Rounded Button.dart';
import 'package:mybetter/Constants.dart';
import '../Controllers/NetworkProviderVerify.dart';


class DataTopUp extends StatefulWidget {
  static const String id = 'DataTopUp';

  @override
  _DataTopUpState createState() => _DataTopUpState();
}


class _DataTopUpState extends State<DataTopUp> {

  var formKey = GlobalKey<FormState>();
  var autoValidate = false;





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
        padding: EdgeInsets.all(20),
        child: Form(
            key: formKey,
            autovalidate: autoValidate,

          child: Column(
            children: [
              TextFormField(
                  onSaved: (value) {
                    print(value);
                  },
                  onChanged: (value){
                    phoneNo = value;
                    setState(() {
                      verifyNetwork();
                    });
                      print(phoneNo);
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
                      labelText: labelText,
                      labelStyle: TextStyle(
                        color: Colors.grey
                      ),
                      )),

              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Image(image: networks,
                  height: 35,),

                  SizedBox(
                    width: 15,
                  ),

                  Container(
                    child: Expanded(
                      child: DropdownButton(
                        isExpanded: true,
                        value: selectedCurrency,
                          iconEnabledColor: kLeadingGradient,
                          hint: Text('sss'),
                          items: [
                            DropdownMenuItem(
                              child: Text('MTN'),
                            value: 'MTN',
                            onTap: (){setState(() {networks = AssetImage('images/MTNN.jpg');});},),
                            DropdownMenuItem(
                              child: Text('AIRTEL'),
                              value: 'AIRTEL',
                              onTap: (){setState(() {networks = AssetImage('images/Airtel.png');});},),
                            DropdownMenuItem(
                              child: Text('GLO'),
                              value: 'GLO',
                              onTap: (){setState(() {networks = AssetImage('images/GLO.jpg');});},),
                            DropdownMenuItem(
                              child: Text('9MOBILE'),
                              value: '9MOBILE',
                              onTap: (){setState(() {networks = AssetImage('images/9mobile.jpg');});},)
                          ],
                          onChanged: (value){
                            setState(() {
                              selectedCurrency = value;
                              print(value);
                            });
                          }),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),


      ),



    );


  }
  void validateInputs() {
    var formState = formKey.currentState;
    if (!formState.validate()) {
      setState(() => autoValidate = true);
      return;
    }


    formState.save();
  }

}
