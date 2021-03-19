// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.plan,
    this.category,
    this.type,
    this.productName,
    this.productId,
    this.offlineId,
    this.pinreceiver,
    this.officialPrice,
    this.discPercent,
    this.commission,
    this.vtutopFee,
  });

  Plan plan;
  Category category;
  Type type;
  String productName;
  String productId;
  String offlineId;
  String pinreceiver;
  dynamic officialPrice;
  String discPercent;
  String commission;
  dynamic vtutopFee;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    plan: planValues.map[json["plan"]],
    category: categoryValues.map[json["category"]],
    type: typeValues.map[json["type"]],
    productName: json["product_name"],
    productId: json["product_id"],
    offlineId: json["offline_id"],
    pinreceiver: json["pinreceiver"],
    officialPrice: json["official_price"],
    discPercent: json["disc_percent"],
    commission: json["commission"],
    vtutopFee: json["vtutop_fee"],
  );

  Map<String, dynamic> toJson() => {
    "plan": planValues.reverse[plan],
    "category": categoryValues.reverse[category],
    "type": typeValues.reverse[type],
    "product_name": productName,
    "product_id": productId,
    "offline_id": offlineId,
    "pinreceiver": pinreceiver,
    "official_price": officialPrice,
    "disc_percent": discPercent,
    "commission": commission,
    "vtutop_fee": vtutopFee,
  };
}

enum Category { DATA_BUNDLE, BROADBAND_DATA, BULK_SMS, AIRTIME_TOPUP, CABLE_TV, ELECTRICITY_BILLS, DATA_PIN, EDUCATION_PAY }

final categoryValues = EnumValues({
  "Airtime Topup": Category.AIRTIME_TOPUP,
  "Broadband data": Category.BROADBAND_DATA,
  "BulkSMS": Category.BULK_SMS,
  "Cable TV": Category.CABLE_TV,
  "Data Bundle": Category.DATA_BUNDLE,
  "DataPIN": Category.DATA_PIN,
  "Education Pay": Category.EDUCATION_PAY,
  "Electricity Bills": Category.ELECTRICITY_BILLS
});

enum Plan { COMPACT010 }

final planValues = EnumValues({
  "Compact010": Plan.COMPACT010
});

enum Type { COMM }

final typeValues = EnumValues({
  "comm": Type.COMM
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
