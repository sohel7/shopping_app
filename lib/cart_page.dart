import 'package:flutter/material.dart';

import 'main.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

  @override
  Widget build(BuildContext context) {
    int totalItems = 0;

    for (var product in products) {
      totalItems += product.counter;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Total Items in Cart:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$totalItems',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
