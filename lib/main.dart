import 'package:flutter/material.dart';
import 'cart_page.dart';

void main() => runApp(ShoppingApp());

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Pizza', price: 10),
    Product(name: 'Burger', price: 20),
    Product(name: 'Ramen', price: 30),
    Product(name: 'Paella', price: 40),
    Product(name: 'Pierogi', price: 50),
    Product(name: 'Moussaka', price: 60),
    Product(name: 'Boeuf Bourgignon', price: 70),
    Product(name: 'Apple', price: 80),
    Product(name: 'Orange', price: 90),
    Product(name: 'Eisbein', price: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(products: products),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: ProductCounter(
              product: products[index],
              onCounterUpdated: (product) {
                if (product.counter == 5) {
                  _showCongratulationsDialog(product);
                }
              },
            ),
          );
        },
      ),
    );
  }

  void _showCongratulationsDialog(Product product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You\'ve bought 5 ${product.name}!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});
}

class ProductCounter extends StatefulWidget {
  final Product product;
  final Function(Product) onCounterUpdated;

  ProductCounter({required this.product, required this.onCounterUpdated});

  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (widget.product.counter > 0) {
                widget.product.counter--;
              }else
              widget.onCounterUpdated(widget.product);
            });
          },
        ),
        Text(widget.product.counter.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              widget.product.counter++;
              widget.onCounterUpdated(widget.product);
            });
          },
        ),
      ],
    );
  }
}
