import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const String routerName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Center(
        child: Text('购物车'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('购物车');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
