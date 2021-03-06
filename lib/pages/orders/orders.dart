import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  static const String routerName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单'),
      ),
      body: Center(
        child: Text('订单'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('菜单');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
