import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WishListState();
  }
}

class WishListState extends State<WishList> {
  Widget _body() {
    return Column(
      children: <Widget>[Container(child: itemList())],
    );
  }

  Widget itemList() {
    return Expanded(
        child: GridView.count(
      childAspectRatio: 0.6,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      crossAxisCount: 2,
      children: List.generate(100, (index) {
        return _itemBody();
      }),
    ));
  }

  Widget _itemBody() {
    return Column(
      children: <Widget>[
        Container(
          height: 240.0,
          margin: EdgeInsets.all(5.0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: AssetImage('assets/sample8.jpg'),
                        fit: BoxFit.cover)),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment(-1.0, 0),
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
          child: Text(
            "Crimson Swade",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          alignment: Alignment(-1.0, 0),
          margin: EdgeInsets.only(left: 5.0),
          child: Text(
            r"$ 150",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
}
