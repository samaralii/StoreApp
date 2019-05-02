import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:a63sales/models/sliderObj.dart';
import 'package:a63sales/models/cat_obj.dart';
import 'package:a63sales/models/customer_detail.dart';
import 'package:uuid/uuid.dart';
import 'package:a63sales/models/detailObj.dart';

class Api {
  static const String BASEURL = "http://hrspidersystem.com/63sales/api/";

  static Future<List<SliderObj>> getSliderItems() async {
    var url = "${BASEURL}slider";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var status = SliderStatus.fromJson(jsonResponse);
      print(status.status);
      return status.data.slider;
    }

    return null;
  }

  static Future<List<CatObj>> getCatItems(int id) async {
    var url = "${BASEURL}getitems?category_id=$id";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var status = CatStatus.fromJson(jsonResponse);
      print(status.status);
      return status.data.item;
    }

    return null;
  }

  static Future<String> checkOut(
      String listJson, CustomerDetail cutomerDetail) async {
    var uuid = Uuid();

    String customerDetailJson = convert.jsonEncode(cutomerDetail);
    String uid = uuid.v1();

    // print(listJson);
    // print(customerDetailJson);
    // print(uid);

    var url =
        "${BASEURL}checkout?listJson=$listJson&security_check=63sales&customer_detail=$customerDetailJson&session_id=$uid";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        var jsonResponse = convert.jsonDecode(response.body);
        return "success";
      } catch (e) {
        print(e.toString());
        return null;
      }
    } else {
      return null;
    }
  }
}
