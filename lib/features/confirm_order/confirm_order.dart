import 'package:flutter/material.dart';
import 'package:a63sales/models/detailObj.dart';
import 'package:a63sales/utilz.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConfirmOrderState();
  }
}

class ConfirmOrderState extends State<ConfirmOrder> {
  List<DetailDataObj> list = [];
  int _radioValue1 = -1;

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

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          print("object");
          break;
        case 1:
          print("object");
          break;
        case 2:
          print("object");
          break;
      }
    });
  }

  _body() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            margin:
                EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 55.0),
            child: Column(
              children: <Widget>[
                _topView(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Text(
                      "Items",
                      style: TextStyle(color: Colors.red, fontSize: 16.0),
                    ),
                  ),
                ),
                _itemList()
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              _showDialog();
              // Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              height: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  border: Border.all(color: Colors.grey, width: 0.5),
                  color: Colors.yellow),
              child: Center(
                  child: Text(
                "Confirm Order",
                style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ],
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Done"),
            content: Text("Your order has been successfully placed."),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Utilz.removeCardList().then((list) {
                  });
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  _topView() {
    return Column(
      children: <Widget>[
        Container(
          child: TextField(
            maxLines: 2,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                labelText: 'Shipping Address',
                labelStyle: TextStyle(color: Colors.red)),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Select Payment Option",
                style: TextStyle(color: Colors.red),
              )),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text("Cash On Delivery")
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text("Paypal")
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: <Widget>[
              Radio(
                value: 2,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text("Credit Card")
            ],
          ),
        ),
      ],
    );
  }

  _itemList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: this.list.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          child: Container(
            height: 50.0,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              NetworkImage(this.list[index].item.images[0].url),
                          fit: BoxFit.cover)),
                ),
                Center(
                  child: Container(
                      height: 50.0,
                      width: 200.0,
                      child: Center(
                        child: Text(
                          this.list[index].item.title,
                          textAlign: TextAlign.center,
                        ),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Confirm Order"),
        ),
        body: _body());
  }
}