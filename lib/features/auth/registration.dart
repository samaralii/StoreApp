import 'package:a63sales/features/auth/login.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationState();
  }
}

class RegistrationState extends State<Registration> {
  String firstName;
  String lastName;
  String phone;
  String address;
  String email;
  String password;

  final _formKey = GlobalKey<FormState>();

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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      onSaved: (value) {
                        this.firstName = value;
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      onSaved: (value) {
                        this.lastName = value;
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      onSaved: (value) {
                        this.phone = value;
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.red)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      onSaved: (value) {
                        this.address = value;
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      onSaved: (value) {
                        this.email = value;
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                      },
                      onSaved: (value) {
                        this.password = value;
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
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

  void _showValidationMsg() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please fill all the required fields"),
            actions: <Widget>[
              FlatButton(
                child: Text("Okay"),
                onPressed: () {
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
        body: _body());
  }
}
