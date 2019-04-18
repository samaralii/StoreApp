import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:a63sales/models/sliderObj.dart';
import 'package:a63sales/models/cat_obj.dart';

class Api {
  static String BASEURL = "http://hrspidersystem.com/63sales/api/";

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
}
