import 'package:a63sales/models/authObj.dart';
import 'package:a63sales/models/detailObj.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class Utilz {
  static const APP_Name = "63Sales";
  static const CART_LIST = "cartList";
  static const WISHLIST = "wishlist";
  static const USER_DATA = "user_data";

  static Future<void> saveUserData(AuthObj obj) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var json = convert.jsonEncode(obj);
    // print(json);
    pref.setString(USER_DATA, json);
  }

  static Future<AuthObj> getUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var json = pref.getString(USER_DATA);

    if (json == null) {
      return null;
    }

    var jsonResponse = convert.jsonDecode(json);
    var authObj = AuthObj.fromJson(jsonResponse);

    return authObj;
  }

  static Future<String> getCartJson() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getString(CART_LIST);

    if (data == null) {
      return null;
    }

    return data;
  }

  static Future<void> deleteUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(USER_DATA);
  }

  static Future<void> addToCart(DetailDataObj item) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var cartList = pref.getString(CART_LIST);

    if (cartList == null) {
      List<DetailDataObj> list = [];
      list.add(item);
      String json = convert.jsonEncode(list);

      pref.setString(CART_LIST, json);

      print(pref.getString(CART_LIST));
      print(json);
    } else {
      var stringJson = pref.getString(CART_LIST);
      List<DetailDataObj> newList = [];

      newList = decodeJson(stringJson);

      newList.add(item);
      String json = convert.jsonEncode(newList);
      pref.setString(CART_LIST, json);

      print(json);
    }
  }

  static Future<List<DetailDataObj>> getCartItems() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    List<DetailDataObj> list = [];

    var stringJson = pref.getString(CART_LIST);
    print(stringJson);

    if (stringJson != null) {
      list = decodeJson(stringJson);
    }

    return list;
  }

  static Future<List<DetailDataObj>> removeFromWishlist(int index) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var stringJson = pref.get(WISHLIST);
    List<DetailDataObj> list = [];

    if (stringJson != null) {
      var newList = decodeJson(stringJson);
      newList.removeAt(index);

      list = newList;

      String json = convert.jsonEncode(list);
      pref.setString(WISHLIST, json);
    }

    return list;
  }

  static Future<List<DetailDataObj>> removeFromCartList(int index) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var stringJson = pref.get(CART_LIST);
    List<DetailDataObj> list = [];

    if (stringJson != null) {
      var newList = decodeJson(stringJson);
      newList.removeAt(index);

      list = newList;

      String json = convert.jsonEncode(list);
      pref.setString(CART_LIST, json);
    }

    return list;
  }

  static Future<void> addToWishlist(DetailDataObj item) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var cartList = pref.getString(WISHLIST);

    if (cartList == null) {
      List<DetailDataObj> list = [];
      list.add(item);
      String json = convert.jsonEncode(list);

      pref.setString(WISHLIST, json);
    } else {
      var stringJson = pref.getString(WISHLIST);
      print(stringJson);

      List<DetailDataObj> newList = [];

      newList = decodeJson(stringJson);

      newList.add(item);
      String json = convert.jsonEncode(newList);
      print(json);

      pref.setString(WISHLIST, json);
    }
  }

  static Future<List<DetailDataObj>> getWishlistItems() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    List<DetailDataObj> list = [];

    var stringJson = pref.getString(WISHLIST);

    if (stringJson != null) {
      list = decodeJson(stringJson);
    }

    return list;
  }

  static List<DetailDataObj> decodeJson(String stringJson) {
    List<DetailDataObj> list = [];

    var decodeJson = convert.jsonDecode(stringJson);

    for (var item in decodeJson) {
      list.add(DetailDataObj.fromJson(item));
    }
    return list;
  }

  static Future<List<DetailDataObj>> updateQty(int index, int value) async {
    final pref = await SharedPreferences.getInstance();
    var stringJson = pref.getString(CART_LIST);

    if (stringJson != null) {
      var list = decodeJson(stringJson);

      list[index].item.qty = value;

      String json = convert.jsonEncode(list);

      pref.setString(CART_LIST, json);

      return list;
    }
  }

  static Future<String> getCartList() async {
    final pref = await SharedPreferences.getInstance();
    var stringJson = pref.getString(CART_LIST);

    if (stringJson == null) {
      return null;
    } else {
      return stringJson;
    }
  }

  static Future<void> removeCardList() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(CART_LIST);
  }
}
