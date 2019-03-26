import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Color color;
  Home(this.color);

  final controller = PageController(initialPage: 0);

  Widget topView() {
    return Container(
        height: 200.0,
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
              image: AssetImage("assets/sample1.jpg"),
              fit: BoxFit.cover
            )
          ),
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

  @override
  Widget build(BuildContext context) {
    return topView();
  }
}
