import 'package:flutter/material.dart';
import 'package:a63sales/utilz.dart';
import 'package:flutter/services.dart';
import 'package:a63sales/features/home/home.dart';
import 'package:a63sales/features/cart/cart.dart';
import 'package:a63sales/features/account/account.dart';
import 'package:a63sales/features/wishlist/wishlist.dart';
import 'package:a63sales/models/categories.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  List<ObjCategories> categories = [];

  final List<Widget> _children = [
    Home(Colors.yellow),
    CartList(),
    WishList(),
    Account(Colors.blue),
  ];

  final List<String> _titles = ["Home", "Cart", "Wishlist", "Account"];

  _getCategories() async {
    var url = "http://hrspidersystem.com/63sales/Api/categories";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var status = ObjStatus.fromJson(jsonResponse);
      print(status.status);

      setState(() {
        this.categories = status.data.categories;
      });
    } else {
      print("failed");
    }
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    //Change status bar color to white
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
      title: Utilz.APP_Name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white, bottomAppBarColor: Colors.white),
      home: mainView(),
    );
  }

  Widget appDrawer() {
    return Drawer(
        child: ListView.builder(
      itemCount: this.categories == null ? 1 : this.categories.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return appDrawerHeader();
        }

        index -= 1;

        // return InkWell(
        //   onTap: () {},
        //   child: ListTile(
        //     title: Text("${this.categories[index].title}"),
        //   ),
        // );

        return ExpansionTile(
          title: Text("${this.categories[index].title}"),
          children: <Widget>[
            Column(
              children: _buildExpandableContent(this.categories[index].tags),
            ),
          ],
        );
      },
    ));
  }

  _buildExpandableContent(List<Tags> list) {
    List<Widget> columnContent = [];

    for (var i = 0; i < list.length; i++) {
      columnContent.add(ListTile(
        title: Text(list[i].title),
      ));
    }

    return columnContent;
  }

  Widget appDrawerHeader() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/sample9.jpg'),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }

  Widget mainView() {
    return Scaffold(
      drawer: appDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(_titles[_selectedIndex]),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            tooltip: 'Air it',
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            tooltip: 'Air it',
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box), title: Text('Cart')),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.favorite), title: Text('Wishlist')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), title: Text('Account')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
