import 'package:flutter/material.dart';

import 'main.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

  @override
  Widget build(BuildContext context) {
    int totalItems = 0;
    List<Product> selectedProducts = []; // Create a list to store selected products

    // Filter the products list to include only the product clicked 5 times
    for (var product in products) {
      totalItems += product.counter;
      if (product.counter == 5) {
        selectedProducts.add(product);
      }
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
            SizedBox(height: 20), // Add some spacing
            Column(
             // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: selectedProducts.map((product) {
                // Display only the selected product(s)
                return ListTile(
                  title: Text('Product Name: ${product.name}'),
                  subtitle: Text('Quantity: ${product.counter}'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
