import 'package:flutter/material.dart';
import 'package:luckincoffee/pages/tide/tide-content.dart';

class TidePage extends StatelessWidget {
  static const String routerName = '/tide';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('潮品'),
      // ),
      body: TideContent(),
    );
  }
}
