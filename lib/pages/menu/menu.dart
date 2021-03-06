import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  static const String routerName = '/menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('菜单'),
      ),
      body: Center(
        child: Text('菜单'),
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
