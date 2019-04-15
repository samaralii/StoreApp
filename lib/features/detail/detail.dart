import 'package:flutter/material.dart';
import 'package:a63sales/utilz.dart';
import 'package:a63sales/models/detailObj.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  int itemId;

  Detail(this.itemId);

  @override
  State<StatefulWidget> createState() {
    return DetailState(this.itemId);
  }
}

class DetailState extends State<Detail> {
  int itemId;
  DetailDataObj data;

  final controller = PageController(initialPage: 0);

  DetailState(this.itemId);

  String html = '<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!';

  _getItemDetail() async {
    print("Item Id = $itemId");
    var url = "http://hrspidersystem.com/63sales/api/details?item_id=$itemId";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var status = DetailObj.fromJson(jsonResponse);
      print("Detail : ${status.status}");

      setState(() {
        this.data = status.data;
      });
    } else {
      print("failed");
    }
  }

  @override
  void initState() {
    super.initState();
    _getItemDetail();
  }

  Widget topView(BuildContext context) {
    return Container(
        height: 400.0,
        child: PageView.builder(
          itemCount: data == null ? 0 : data.item.images.length,
          itemBuilder: (context, index) {
            return topViewItems(context, index);
          },
        ));
  }

  Widget topViewItems(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(data.item.images[index].url),
                  fit: BoxFit.cover)),
        ),
      ],
    );
  }

  Widget body() {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              topView(context),
              // Container(
              //   height: 400.0,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage('assets/sample11.jpg'),
              //           fit: BoxFit.cover)),
              // ),

              Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data == null ? " " : data.item.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    Text(
                      data == null ? " " : data.item.price.toString(),
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Regular Fit",
                        style: TextStyle(color: Colors.grey),
                      ))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 10.0, top: 20.0, bottom: 10.0),
                      child: Text(
                        "Sizes",
                        style: TextStyle(color: Colors.grey),
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  sizeButton(),
                  sizeButton(),
                  sizeButton(),
                ],
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 10.0, top: 20.0, bottom: 10.0),
                      child: Text(
                        "Description",
                        style: TextStyle(color: Colors.grey),
                      ))),

              Container(
                height: 300.0,
                child: HtmlView(
                  data: this.data == null ? "" : this.data.item.description,
                  // data: "",
                ),
              ),

              //bottom space
              Container(
                height: 70.0,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        border: Border.all(color: Colors.grey, width: 0.5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      "Add To Wishlist",
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        border: Border.all(color: Colors.grey, width: 0.5),
                        color: Colors.yellow),
                    child: Center(
                        child: Text(
                      "Add To Cart",
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget sizeButton() {
    return Container(
      height: 30.0,
      width: 80.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: Colors.black, width: 1.0)),
      child: Center(
        child: Text("UK44"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: body(),
    );
  }
}
