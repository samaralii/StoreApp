import 'package:flutter/material.dart';
import 'package:a63sales/models/cat_obj.dart';
import 'package:a63sales/web_services.dart';
import 'package:a63sales/features/detail/detail.dart';

class NewArrivals extends StatefulWidget {
  int id;

  NewArrivals(this.id);

  @override
  State<StatefulWidget> createState() {
    return NewArrivalsState(id);
  }
}

class NewArrivalsState extends State<NewArrivals> {
  int id;

  NewArrivalsState(this.id);

  List<CatObj> list = [];

  var _isLoading = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      _isLoading = true;
    });

    Api.getCatItems(id).then((onValue) {
      setState(() {
        this.list = onValue;
        _isLoading = false;
      });
    });
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
      childAspectRatio: 0.5,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      crossAxisCount: 2,
      children: List.generate(list.length, (index) {
        return _itemBody(list[index]);
      }),
    ));
  }

  Widget _itemBody(CatObj data) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Detail(data.id, null)));
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
                          image: NetworkImage(data.image), fit: BoxFit.cover)),
                ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Container(
                //     child: IconButton(
                //       icon: Icon(Icons.favorite),
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            alignment: Alignment(-1.0, 0),
            margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
            child: Text(
              data.title,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            alignment: Alignment(-1.0, 0),
            margin: EdgeInsets.only(left: 5.0),
            child: Text(
              data.price.toString(),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
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
      body: Stack(
        children: <Widget>[
          _body(),
          Positioned(
              child: _isLoading
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                      color: Colors.white.withOpacity(0.8),
                    )
                  : Container())
        ],
      ),
    );
  }
}
