import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final Color color;
  Cart(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 50.0,
            ),
            Text(
              "Cart is empty",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
