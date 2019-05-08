import 'package:a63sales/features/auth/registration.dart';
import 'package:a63sales/utilz.dart';
import 'package:a63sales/web_services.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  var _isLoading = false;

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
                        controller: email,
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
                        controller: password,
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
                          setState(() {
                            _isLoading = true;
                          });
                          Api.login(email.text, password.text).then((onValue) {
                            setState(() {
                              _isLoading = false;
                            });
                            if (onValue != null) {
                              Navigator.pop(context);
                              Utilz.saveUserData(onValue);
                            }
                          });
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
        child: Stack(
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
        ),
      ),
    );
  }
}
