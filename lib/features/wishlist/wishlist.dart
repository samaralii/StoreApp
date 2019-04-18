import 'package:flutter/material.dart';
import 'package:a63sales/models/detailObj.dart';
import 'package:a63sales/utilz.dart';
import 'package:a63sales/features/detail/detail.dart';

class WishList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WishListState();
  }
}

class WishListState extends State<WishList> {
  List<DetailDataObj> list;

  @override
  void initState() {
    super.initState();
    Utilz.getWishlistItems().then((list) {
      if (list != null && list.isNotEmpty) {
        setState(() {
          this.list = list;
        });
      }
    });
  }

  Widget _body() {
    return Column(
      children: <Widget>[Container(child: itemList())],
    );
  }

  Widget itemList() {
    return Expanded(
        child: GridView.count(
      childAspectRatio: 0.5,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      crossAxisCount: 2,
      children: List.generate(list == null ? 0 : list.length, (index) {
        return _itemBody(index);
      }),
    ));
  }

  Widget _itemBody(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Detail(null, this.list[index])));
      },
      child: Column(
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
                          image:
                              NetworkImage(this.list[index].item.images[0].url),
                          fit: BoxFit.cover)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: IconButton(
                      onPressed: () {
                        Utilz.removeFromWishlist(index).then((newlist) {
                          setState(() {
                            this.list = newlist;
                          });
                        });
                      },
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
              this.list[index].item.title,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            alignment: Alignment(-1.0, 0),
            margin: EdgeInsets.only(left: 5.0),
            child: Text(
              this.list[index].item.price.toString(),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
}
