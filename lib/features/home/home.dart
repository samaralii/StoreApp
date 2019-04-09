import 'package:flutter/material.dart';
import 'package:a63sales/features/sub_items/subItems.dart';
import 'package:a63sales/features/new_arrivals.dart';
import 'package:a63sales/models/categories.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final controller = PageController(initialPage: 0);

  final List<String> _titles = [
    "What's new",
    "Spring Summer 2019",
    "Swagger",
    "Winter"
  ];
  final List<String> _name = ["Men", "Women", "Girls", "Boys"];

  List<ObjCategories> categories = [];

  _getCategories() async {
    var url = "http://hrspidersystem.com/63sales/Api/categories";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var status = ObjStatus.fromJson(jsonResponse);
      print(status.status);

      setState(() {
        this.categories = status.data.categories;
      });
    } else {
      print("failed");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _getCategories();
  }

  Widget topView(BuildContext context) {
    return Container(
        height: 200.0,
        child: PageView(
          controller: controller,
          children: <Widget>[
            topViewItems(context),
            topViewItems(context),
            topViewItems(context),
          ],
        ));
  }

  Widget topViewItems(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/sample1.jpg"), fit: BoxFit.cover)),
        ),
        Container(
          margin: EdgeInsets.only(left: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("New Arrivals",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text("Check out out fresh new stuff \nfrom 63 Sales",
                    style: TextStyle(fontSize: 12.0, color: Colors.white)),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewArrivals()));
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
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return storeItems(context, index);
        },
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
                  _titles[index],
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
          subItemsList()
        ],
      ),
    );
  }

  Widget subItemsList() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return subItems(context, index);
        },
      ),
    );
  }

  Widget subItems(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubItems(categories[index].title)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        height: 185.0,
        width: 120.0,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                      // image: AssetImage('assets/sample2.jpg'),
                      image: NetworkImage(categories[index].image),
                      fit: BoxFit.cover)),
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
                        child: Text(
                          categories[index].title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              color: Colors.white),
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
