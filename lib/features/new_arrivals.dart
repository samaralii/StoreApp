import 'package:flutter/material.dart';

class NewArrivals extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewArrivalsState();
  }
}

Widget _body() {
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[_filerView(), _sortView()],
        ),
      ),
      itemList()
    ],
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
        height: 270.0,
        margin: EdgeInsets.all(5.0),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      image: AssetImage('assets/sample6.jpeg'),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.favorite),
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

Widget _filerView() {
  return InkWell(
    onTap: () {},
    child: Container(
        child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.filter_list,
            color: Colors.black,
          ),
        ),
        Text(
          "FILTER",
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
      ],
    )),
  );
}

Widget _sortView() {
  return InkWell(
    onTap: () {},
    child: Container(
        child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.sort,
            color: Colors.black,
          ),
        ),
        Text(
          "SORT",
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
      ],
    )),
  );
}

class NewArrivalsState extends State<NewArrivals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Arrivals"),
        backgroundColor: Colors.white,
        elevation: 1.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            tooltip: 'Air it',
          )
        ],
      ),
      body: _body(),
    );
  }
}
