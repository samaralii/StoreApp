import 'package:flutter/material.dart';
import 'package:a63sales/utilz.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'cart.dart';
import 'account.dart';
import 'wishlist.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    Home(Colors.red),
    Cart(Colors.yellow),
    Wishlist(Colors.green),
    Account(Colors.blue),
  ];

  final List<String> _titles = ["Home", "Cart", "Wishlist", "Account"];

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
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          DrawerHeader(
            child: Text("63 Sales"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Categories 1'),
          ),
          ListTile(
            title: Text('Categories 2'),
          ),
          ListTile(
            title: Text('Categories 3'),
          ),
          ListTile(
            title: Text('Categories 4'),
          ),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Wishlist')),
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
