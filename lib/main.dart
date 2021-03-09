// @dart=2.9
import 'package:flutter/material.dart';
import 'package:luckincoffee/pages/main/main.dart';
import 'package:luckincoffee/routes/router.dart';
import 'package:luckincoffee/shared/size-hot.dart';
import 'package:luckincoffee/shared/theme.dart';
import 'package:luckincoffee/view-model/product-view-model.dart';
import 'package:luckincoffee/view-model/tide-view-model.dart';
import 'package:provider/provider.dart';

void main() {
  SizeHot.initialize();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => ProductViewModel()),
      ChangeNotifierProvider(create: (ctx) => TideViewModel()),
    ],
    child: App(),
  ));
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
