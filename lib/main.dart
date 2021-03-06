// @dart=2.9
import 'package:flutter/material.dart';
import 'package:luckincoffee/pages/main/main.dart';
import 'package:luckincoffee/routes/router.dart';
import 'package:luckincoffee/shared/size-hot.dart';
import 'package:luckincoffee/shared/theme.dart';

void main() {
  SizeHot.initialize();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appThtme,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
