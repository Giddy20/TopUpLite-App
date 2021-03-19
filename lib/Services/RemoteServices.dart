import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mybetter/Controllers/ProductController.dart';
import 'package:mybetter/Models/Products.dart';

class RemoteServices{

  ProductController productController = Get.put(ProductController());

  static var client = http.Client();

  var username = 0701457388;
  var pass = "escape4christ";

  static Future<List<Products>> fetchProducts({String username, String password}) async{
    var response = await client.get('https://vtutopupbox.com/b2bhub/api/products?' + 'username=' + username + 'password=' + password);
    if(response.statusCode == 200){
      var jsonString = response.body;

      getParams(jsonString);
      return productsFromJson(jsonString);


    }
    else{
      return null;
    }
  }


}


void getParams(jstring){
  var decoded = jsonDecode(jstring);
  var that = decoded[1];
  print(that);
  return decoded;
}