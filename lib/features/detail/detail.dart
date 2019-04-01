import 'package:flutter/material.dart';
import 'package:a63sales/utilz.dart';

class Detail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailState();
  }
}

Widget body() {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/sample11.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Crimson Swade",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(
                    r"$129",
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
                      "Fit Details",
                      style: TextStyle(color: Colors.grey),
                    ))),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 10.0),
                    child: Text(
                      Utilz.LONG_TEXT,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey),
                    ))),

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

class DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: body(),
    );
  }
}
