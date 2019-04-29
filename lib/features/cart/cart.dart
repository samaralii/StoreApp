import 'package:flutter/material.dart';
import 'package:a63sales/models/detailObj.dart';
import 'package:a63sales/utilz.dart';
import 'package:a63sales/features/confirm_order/confirm_order.dart';
import 'package:a63sales/features/auth/login.dart';

class CartList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartListState();
  }
}

class CartListState extends State<CartList> with WidgetsBindingObserver {
  List<DetailDataObj> list = [];
  String selectedVal = "1";

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state.index);
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
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
                child: InkWell(
                  onTap: () {
                    Utilz.getCartList().then((json) {
                      print(json);
                    });
                  },
                  child: InkWell(
                    onTap: () {
                      if (this.list.isEmpty) {
                        _showEmptyCartDialog();
                        return;
                      }
                      _showAuthDialog();
                    },
                    child: Container(
                      height: 35,
                      width: 70.0,
                      color: Colors.yellow,
                      child: Center(
                        child: Text("Checkout"),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      ],
    );
  }

  void _showDialog(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text("Are you sure you want to delete this item?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Utilz.removeFromCartList(index).then((list) {
                    this.list = list;
                    setState(() {});
                  });
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void _showAuthDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text(""),
            actions: <Widget>[
              FlatButton(
                child: Text("Continue as a guest"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ConfirmOrder(totalAmount().toString())))
                      .then((onValue) {
                    if (onValue) {
                      setState(() {
                        this.list = [];
                      });
                    }
                  });
                },
              ),
              FlatButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              )
            ],
          );
        });
  }

  void _showEmptyCartDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Cart Is Empty"),
            actions: <Widget>[
              FlatButton(
                child: Text("Okay"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
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
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7',
                                  '8',
                                  '9'
                                ].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                value: this.list[index].item.qty == null
                                    ? "1"
                                    : this.list[index].item.qty.toString(),
                                hint: Text('1'),
                                onChanged: (value) {
                                  // selectedVal = value;
                                  Utilz.updateQty(index, int.parse(value))
                                      .then((newList) {
                                    this.list = newList;
                                    setState(() {});
                                  });
                                },
                              ),
                            ),
                          ),
                          Text(
                            "   X   ",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(_getPrice(index),
                              style: TextStyle(fontSize: 15.0))
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        _showDialog(index);
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

  _getPrice(int index) {
    var price = this.list[index].item.price;
    var qty = this.list[index].item.qty == null ? 1 : this.list[index].item.qty;

    var total = price * qty;

    return total.toString() + r'$';
  }

  int totalAmount() {
    int amount = 0;

    for (var i in this.list) {
      var price = i.item.price;
      var qty = i.item.qty == null ? 1 : i.item.qty;
      var total = price * qty;

      amount += total;
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
