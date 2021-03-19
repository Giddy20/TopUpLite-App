import 'dart:convert';

import 'package:get/get.dart';
import 'package:mybetter/Models/Products.dart';
import 'package:mybetter/Services/RemoteServices.dart';

class ProductController extends GetxController{
  var productList = List<Products>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  var username = '0701457388';
  var pass = "escape4christ";

  Future fetchProducts() async{

    var products = await RemoteServices.fetchProducts(username: username,password: pass);
    if(products!=null){
      productList.assignAll(products);
    }
  }



}