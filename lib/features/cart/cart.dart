import 'package:flutter/material.dart';
import 'package:a63sales/models/detailObj.dart';
import 'package:a63sales/utilz.dart';
import 'package:a63sales/features/detail/detail.dart';

class CartList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartListState();
  }
}

class CartListState extends State<CartList> {
  List<DetailDataObj> list = [];
  String selectedVal = "1";

  @override
  void initState() {
    super.initState();
    Utilz.getCartItems().then((list) {
      if (list != null && list.isNotEmpty) {
        setState(() {
          this.list = list;
        });
      }
    });
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        _itemList(),
        Container(
          margin: EdgeInsets.all(5.0),
          height: 50.0,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Total: " + totalAmount().toString() + r"$",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  )),
              InkWell(
                onTap: () {
                  print("object");
                },
                child: Container(
                  height: 35,
                  width: 70.0,
                  color: Colors.yellow,
                  child: Center(
                    child: Text("Checkout"),
                  ),
                ),
              )
            ],
          )),
        ),
      ],
    );
  }

  _itemList() {
    return Expanded(
      child: ListView.builder(
        itemCount: this.list.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            child: Container(
              height: 100.0,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                this.list[index].item.images[0].url),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          height: 40.0,
                          width: 200.0,
                          child: Text(
                            this.list[index].item.title,
                            textAlign: TextAlign.center,
                          )),
                      Row(
                        children: <Widget>[
                          Text("Qty:     ", style: TextStyle(fontSize: 15.0)),
                          Container(
                            height: 28.0,
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.0)),
                            child: Center(
                              child: DropdownButton<String>(
                                items: <String>['1', '2', '3', '4', '5']
                                    .map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                value: selectedVal,
                                hint: Text("1"),
                                onChanged: (value) {
                                  selectedVal = value;
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          Text(
                            "   X   ",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(this.list[index].item.price.toString() + r"$",
                              style: TextStyle(fontSize: 15.0))
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        Utilz.removeFromCartList(index).then((list) {
                          this.list = list;
                          setState(() {});
                        });
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  int totalAmount() {
    int amount = 0;

    for (var i in this.list) {
      amount += i.item.price;
    }

    return amount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
}
