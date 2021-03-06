import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routerName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Center(
        child: Text('我的'),
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
