import 'package:flutter/material.dart';
import 'package:a63sales/utilz.dart';


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
  
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '63Sales',
      debugShowCheckedModeBanner: false,
      home: mainView(),
    );
  }

  Widget mainView() {
    return Scaffold(
      backgroundColor: Utilz.APP_BG,
      body: Center(
        child: Text("data"),
      ),
    );
  }
  
}