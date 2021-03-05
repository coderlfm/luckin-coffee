import 'package:flutter/cupertino.dart';
import 'package:luckincoffee/pages/main/main.dart';
import 'package:luckincoffee/pages/profile/profile.dart';

class AppRoutes {
  static final initialRoute = MainPage.routerName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routerName: (ctx) => MainPage(),
    ProfilePage.routerName: (ctx) => ProfilePage(),
  };
}
