import 'package:flutter/material.dart';
import 'package:a63sales/utilz.dart';
import 'package:a63sales/models/detailObj.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  int itemId;
  DetailDataObj data;

  Detail(this.itemId, this.data);

  @override
  State<StatefulWidget> createState() {
    return DetailState(this.itemId, this.data);
  }
}

class DetailState extends State<Detail> {
  int itemId;
  DetailDataObj data;
  var _isLoading = false;
  var showButtons = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  final controller = PageController(initialPage: 0);

  DetailState(this.itemId, this.data);

  _getItemDetail() async {
    setState(() {
      _isLoading = true;
    });

    print("Item Id = $itemId");
    var url = "http://hrspidersystem.com/63sales/api/details?item_id=$itemId";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var status = DetailObj.fromJson(jsonResponse);
      print("Detail : ${status.status}");

      setState(() {
        _isLoading = false;
        showButtons = true;
        this.data = status.data;
      });
    } else {
      print("failed");
    }
  }

  @override
  void initState() {
    super.initState();

    if (data == null) {
      _getItemDetail();
    } else {
      print(data.item.attributes[0].attr.length);
      for (var item in data.item.attributes[0].attr) {
        print(item.isSelected);
      }
    }
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
              Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data == null ? " " : data.item.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data == null ? " " : r"$" + data.item.price.toString(),
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

              Column(
                children: _buildAttrItems(),
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
        this.showButtons == true
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  height: 50.0,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Utilz.addToCart(this.data).then((_) {
                            _showDialog("Successfully added to Wishlist");
                          });
                        },
                        child: Container(
                          height: 40.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
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
              )
            : Container(),
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
    );
  }

  void _showDialog(String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Done"),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  _buildAttrItems() {
    List<Widget> columnContent = [];

    if (this.data != null &&
        this.data.item != null &&
        this.data.item.attributes != null) {
      for (int i = 0; i < this.data.item.attributes.length; i++) {
        columnContent.add(Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin:
                        EdgeInsets.only(left: 10.0, top: 20.0, bottom: 10.0),
                    child: Text(
                      this.data.item.attributes[i].name,
                      style: TextStyle(color: Colors.grey),
                    ))),
            Container(
              height: 35.0,
              child: ListView.builder(
                itemCount: this.data.item.attributes[i].attr.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return attrButton(this.data.item.attributes[i].attr, index);
                },
              ),
            ),
          ],
        ));
      }
    }

    return columnContent;
  }

  Widget attrButton(List<AttrObj> attrList, index) {
    return InkWell(
      onTap: () {
        setState(() {
          attrList.forEach((item) => item.isSelected = false);
          attrList[index].isSelected = true;
        });
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        height: 35.0,
        width: 80.0,
        decoration: BoxDecoration(
            color: attrList[index].isSelected == true
                ? Colors.yellow
                : Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.black, width: 1.0)),
        child: Center(
          child: Text(attrList[index].name),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data == null ? "" : data.item.title),
      ),
      body: body(),
    );
  }
}
