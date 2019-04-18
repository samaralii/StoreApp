import 'package:a63sales/models/detailObj.dart';

class CartObj {
  List<DetailDataObj> cartList;

  CartObj(this.cartList);

  Map<String, dynamic> toJson() => {"cartList": cartList};

  CartObj.fromJson(Map<String, dynamic> parsedJson) {
    this.cartList = [];
    var list = parsedJson['cartList'];

    for (var item in list) {
      this.cartList.add(parsedJson[item]);
    }
  }
}
