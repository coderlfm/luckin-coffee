import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const String routerName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: Center(
        child: Text('main 主页'),
      ),
    );
  }
}
