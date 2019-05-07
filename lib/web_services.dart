import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:a63sales/models/sliderObj.dart';
import 'package:a63sales/models/cat_obj.dart';
import 'package:a63sales/models/customer_detail.dart';
import 'package:uuid/uuid.dart';
import 'package:a63sales/models/authObj.dart';

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

  static Future<AuthObj> login(String email, String password) async {
    var url = "${BASEURL}login";

    Map<String, String> body = {
      'email': email,
      'password': password,
    };

    var response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var authObj = AuthObj.fromJson(jsonResponse);
      print(authObj.status);
      return authObj;
    }

    return null;
  }

  static Future<String> registration(String fName, String lName,
      String address, String email, String username, String password) async {
    var url = "${BASEURL}register";

    Map<String, String> body = {
      'firstname': fName,
      'lastname': lName,
      'username': username,
      'email': email,
      'password': password,
      'address': address,
    };

    print(body);

    var response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var status = jsonResponse['status'];
      print(status);
      return status;
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
