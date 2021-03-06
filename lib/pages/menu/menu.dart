import 'package:flutter/material.dart';
import 'package:luckincoffee/pages/menu/menu-content.dart';

class MenuPage extends StatelessWidget {
  static const String routerName = '/menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择咖啡和美食'),
        backgroundColor: Colors.white,
      ),
      body: MenuContent(),
    );
  }
}
