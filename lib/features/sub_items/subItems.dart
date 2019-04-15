import 'package:flutter/material.dart';
import 'package:a63sales/features/detail/detail.dart';


class SubItems extends StatefulWidget {
  // final ObjItems categories;

  // SubItems(this.categories);

  @override
  State<StatefulWidget> createState() {
    return SubItemsState();
  }
}

class SubItemsState extends State<SubItems> {
  // final ObjCategories categories;

  // SubItemsState(this.categories);

  final List<String> _name = ["Trousers", "Shorts", "Denims", "Suits"];

  final controller = PageController(initialPage: 0);

  Widget topView() {
    return Container(
        height: 140.0,
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
                  image: AssetImage("assets/sample4.jpg"), fit: BoxFit.cover)),
        ),
        Container(
          margin: EdgeInsets.only(left: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Swaggers",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text("Unleash your inner swag,\nin style.",
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
                      // Text(
                      //   ">",
                      //   style: TextStyle(color: Colors.black, fontSize: 15.0),
                      // ),
                      Icon(Icons.arrow_right)
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
        child: GridView.count(
      childAspectRatio: 0.6,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 3,
      children: List.generate(3, (index) {
        return _itemBody(index);
      }),
    ));
  }

  Widget _itemBody(int index) {
    return Column(
      children: <Widget>[
        Container(
          height: 180.0,
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
                alignment: Alignment.bottomLeft,
                child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: Text(
                      "Title",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget subItems(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Detail()));
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        height: 120.0,
        width: 120.0,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                      image: AssetImage('assets/sample5.jpeg'),
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
                        _name[index],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.white),
                      ),
                      Text(
                        "",
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

  // Widget storeItemsList() {
  //   return Expanded(
  //     child: ListView.builder(
  //       itemCount: 4,
  //       itemBuilder: (context, position) {
  //         return storeItems(position);
  //       },
  //     ),
  //   );
  // }

  // Widget storeItems(int index) {
  //   return Container(
  //     height: 160.0,
  //     margin: EdgeInsets.all(8.0),
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           margin:
  //               EdgeInsets.only(top: 5.0, left: 5.0, bottom: 15.0, right: 5.0),
  //           child: Row(
  //             children: <Widget>[
  //               Expanded(
  //                   child: Text(
  //                 _titles[index],
  //                 style: TextStyle(
  //                     color: Colors.black, fontWeight: FontWeight.bold),
  //               )),
  //               Expanded(
  //                   child: Text(
  //                 "View All",
  //                 textAlign: TextAlign.end,
  //                 style: TextStyle(
  //                     color: Colors.black, fontWeight: FontWeight.bold),
  //               )),
  //             ],
  //           ),
  //         ),
  //         subItemsList()
  //       ],
  //     ),
  //   );
  // }

  // Widget subItemsList() {
  //   return Expanded(
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: 4,
  //       itemBuilder: (context, index) {
  //         return subItems(context, index);
  //       },
  //     ),
  //   );
  // }

  // Widget subItems(BuildContext context, int index) {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Detail()));
  //     },
  //     child: Container(
  //       margin: EdgeInsets.only(right: 20.0),
  //       height: 120.0,
  //       width: 120.0,
  //       child: Stack(
  //         children: <Widget>[
  //           Container(
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(4.0),
  //                 image: DecorationImage(
  //                     image: AssetImage('assets/sample5.jpeg'),
  //                     fit: BoxFit.cover)),
  //           ),
  //           Align(
  //             alignment: Alignment.bottomLeft,
  //             child: Container(
  //                 margin: EdgeInsets.all(3.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: <Widget>[
  //                     Text(
  //                       _name[index],
  //                       textAlign: TextAlign.start,
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 12.0,
  //                           color: Colors.white),
  //                     ),
  //                     Text(
  //                       "",
  //                       textAlign: TextAlign.end,
  //                       style: TextStyle(
  //                         fontSize: 12.0,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ],
  //                 )),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        backgroundColor: Colors.white,
        elevation: 0.0,
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
      body: Column(
        children: <Widget>[topView(), storeItemsList()],
      ),
    );
  }
}
