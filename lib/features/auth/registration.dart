import 'package:a63sales/web_services.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationState();
  }
}

class RegistrationState extends State<Registration> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _isLoading = false;

  _body() {
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: firstName,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: Colors.red)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: lastName,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: 'Last Name',
                          labelStyle: TextStyle(color: Colors.red)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.red)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: address,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: 'Address',
                          labelStyle: TextStyle(color: Colors.red)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.red)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.red)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: ButtonTheme(
                      minWidth: 130.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            Api.registration(
                                    firstName.text,
                                    lastName.text,
                                    address.text,
                                    email.text,
                                    username.text,
                                    password.text)
                                .then((status) {
                              setState(() {
                                _isLoading = false;
                              });
                              _showSuccessMsg();
                            });
                          }
                        },
                        textColor: Colors.red,
                        color: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        child: Text("Sign Up"),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  void _showSuccessMsg() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Successfull"),
            content: Text(""),
            actions: <Widget>[
              FlatButton(
                child: Text("Okay"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
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
                    : Container()),
          ],
        ));
  }
}
