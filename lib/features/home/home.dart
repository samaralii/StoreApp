import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Color color;
  Home(this.color);

  final controller = PageController(initialPage: 0);

  Widget topView() {
    return Container(
        height: 170.0,
        child: PageView(
          controller: controller,
          children: <Widget>[
            topViewItems(),
            topViewItems(),
            topViewItems(),
          ],
        ));
  }

  Widget topViewItems() {
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
                onTap: _onTapShopeNow(),
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
                      Text(
                        ">",
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
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

  _onTapShopeNow() {
    print("object");
  }

  Widget storeItemsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) {
          return storeItems();
        },
      ),
    );
  }

  Widget storeItems() {
    return Container(
      height: 165.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  "Item Title",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
                Expanded(
                    child: Text(
                  "View All",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
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
        itemCount: 20,
        itemBuilder: (context, index) {
          return subItems();
        },
      ),
    );
  }

  Widget subItems() {
    return Container(
      margin: EdgeInsets.all(3.0),
      height: 155.0,
      width: 100.0,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sample2.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                margin: EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Name",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.white),
                    ),
                    Text(
                      ">",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[topView(), storeItemsList()],
    );
  }
}
