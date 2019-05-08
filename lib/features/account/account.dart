import 'package:a63sales/features/auth/login.dart';
import 'package:a63sales/features/auth/registration.dart';
import 'package:a63sales/models/authObj.dart';
import 'package:flutter/material.dart';
import 'package:a63sales/utilz.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountState();
  }
}

class AccountState extends State<Account> {
  AuthObj userData;

  @override
  initState() {
    super.initState();
    Utilz.getUserData().then((onValue) {
      if (onValue != null) {
        userData = onValue;
        setState(() {});
      }
    });
  }

  Widget _topView() {
    return Container(
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15.0, top: 15.0),
            child: InkWell(
              onTap: () {
                print("view profile");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${userData.data.firstname} ${userData.data.lastname}",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View Profile",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/sample10.jpeg'),
                )),
          ),
        ],
      ),
    );
  }

  Widget _customButton(String text) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                Icon(
                  Icons.arrow_right,
                  size: 30.0,
                )
              ],
            ),
            Container(
              height: 0.5,
              margin: EdgeInsets.only(top: 20.0, right: 5.0),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  _logoutBtn(String text, BuildContext context) {
    return InkWell(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
        margin:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                Icon(
                  Icons.arrow_right,
                  size: 30.0,
                )
              ],
            ),
            Container(
              height: 0.5,
              margin: EdgeInsets.only(top: 20.0, right: 5.0),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Action"),
            content: Text("Are you sure you want logout?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Utilz.deleteUserData();
                  Navigator.pop(context);
                  setState(() {
                    userData = null;
                  });
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return userData == null
        ? Container(
            margin: EdgeInsets.only(top: 200.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 180.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      textColor: Colors.red,
                      color: Colors.yellow,
                      padding: EdgeInsets.all(8.0),
                      child: Text("Login"),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 180.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registration()));
                      },
                      textColor: Colors.red,
                      color: Colors.yellow,
                      padding: EdgeInsets.all(8.0),
                      child: Text("Registration"),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _topView(),
                _customButton("My Wishlist"),
                _customButton("Orders"),
                _customButton("Returns"),
                _customButton("Wallet"),
                _customButton("Accounts details"),
                _customButton("Preferences"),
                _customButton("Shipping Information"),
                _customButton("Security"),
                _customButton("FAQ"),
                _logoutBtn("Logout", context),
              ],
            ),
          );
  }
}
