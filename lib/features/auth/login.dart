import 'package:a63sales/features/auth/registration.dart';
import 'package:flutter/material.dart';
import 'package:a63sales/utilz.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  _body() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 50.0, bottom: 20.0),
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/sample_icon.jpeg"),
                      fit: BoxFit.cover)),
            ),
          ),
          Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) return 'Required Field';
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blueGrey,
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.red)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Required Field';
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blueGrey,
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.red)),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print("forget password");
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: ButtonTheme(
                      minWidth: 130.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registration()));
                        },
                        textColor: Colors.red,
                        color: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        child: Text("Sign Up"),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 130.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Utilz.saveUserData();
                          Navigator.pop(context);
                        }
                      },
                      textColor: Colors.red,
                      color: Colors.yellow,
                      padding: EdgeInsets.all(8.0),
                      child: Text("Log In"),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text("Sign In"),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }
}
