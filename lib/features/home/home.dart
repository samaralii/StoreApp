import 'package:flutter/material.dart';
import 'package:a63sales/features/sub_items/subItems.dart';
import 'package:a63sales/features/new_arrivals.dart';

class Home extends StatelessWidget {
  final Color color;
  Home(this.color);

  final controller = PageController(initialPage: 0);

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

  Widget storeItemsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) {
          return storeItems(context);
        },
      ),
    );
  }

  Widget storeItems(BuildContext context) {
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
                  "Item Title",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SubItems()));
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
        itemCount: 20,
        itemBuilder: (context, index) {
          return subItems(context);
        },
      ),
    );
  }

  Widget subItems(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                      image: AssetImage('assets/sample2.jpg'),
                      fit: BoxFit.cover)),
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
                          color: Colors.white,
                        ),
                      ),
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
