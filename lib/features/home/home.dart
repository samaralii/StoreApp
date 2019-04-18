import 'package:flutter/material.dart';
import 'package:a63sales/features/sub_items/subItems.dart';
import 'package:a63sales/features/new_arrivals.dart';
import 'package:a63sales/models/home.dart';
import 'package:a63sales/features/detail/detail.dart';
import 'package:a63sales/web_services.dart';
import 'package:a63sales/models/sliderObj.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  final Color color;
  Home(this.color);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final controller = PageController(initialPage: 0);
  var _isLoading = false;

  final List<String> _titles = [
    "What's new",
    "Spring Summer 2019",
    "Swagger",
    "Winter"
  ];
  final List<String> _name = ["Men", "Women", "Girls", "Boys"];

  List<ObjPages> listpages = [];
  List<SliderObj> listSlider = [];

  _getCategories() async {
    setState(() {
      _isLoading = true;
    });

    var url = "http://hrspidersystem.com/63sales/Api/home";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var status = ObjHome.fromJson(jsonResponse);
      print("Home : ${status.status}");

      setState(() {
        _isLoading = false;
        this.listpages = status.data.pages;
      });
    } else {
      print("failed");
    }
  }

  @override
  void initState() {
    super.initState();
    _getCategories();

    Api.getSliderItems().then((onValue) {
      setState(() {
        this.listSlider = onValue;
      });
    });
  }

  Widget topView(BuildContext context) {
    return Container(
      height: 200.0,
      child: PageView.builder(
          controller: controller,
          itemCount: this.listSlider.length,
          itemBuilder: (context, index) {
            return topViewItems(context, this.listSlider[index]);
          }),
    );
  }

  Widget topViewItems(BuildContext context, SliderObj data) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(data.image), fit: BoxFit.cover)),
        ),
        Container(
          margin: EdgeInsets.only(left: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(data.title,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Container(
                width: 140.0,
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(data.description,
                    style: TextStyle(fontSize: 12.0, color: Colors.white)),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewArrivals(data.id)));
                },
                child: Container(
                  width: 100.0,
                  height: 25.0,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "SHOP NOW",
                        style: TextStyle(color: Colors.black, fontSize: 11.0),
                      ),
                      // Text(
                      //   ">",
                      //   style: TextStyle(color: Colors.black, fontSize: 15.0),
                      // ),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget storeItemsList() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: listpages.length,
            itemBuilder: (context, index) {
              return storeItems(context, index);
            },
          ),
          Positioned(
              child: _isLoading
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                      color: Colors.white.withOpacity(0.8),
                    )
                  : Container()),
        ],
      ),
    );
  }

  Widget storeItems(BuildContext context, int index) {
    return Container(
      height: 190.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  listpages[index].title,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => SubItems()));
                  },
                  child: Text(
                    "View All",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
              ],
            ),
          ),
          subItemsList(listpages[index].items)
        ],
      ),
    );
  }

  Widget subItemsList(List<ObjItems> data) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return subItems(context, data[index]);
        },
      ),
    );
  }

  Widget subItems(BuildContext context, ObjItems data) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Detail(data.id, null)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        height: 185.0,
        width: 170.0,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                      image: NetworkImage(data.image), fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  margin: EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 3.0),
                        child: Container(
                          width: 120,
                          child: Text(
                            data.itemTitle,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      // Text(
                      //   ">",
                      //   textAlign: TextAlign.end,
                      //   style: TextStyle(
                      //     fontSize: 12.0,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      Icon(Icons.arrow_right, color: Colors.white)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[topView(context), storeItemsList()],
    );
  }
}
