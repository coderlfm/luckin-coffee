import 'package:flutter/material.dart';

import 'package:luckincoffee/pages/main/main.dart';
import 'package:luckincoffee/pages/home/home.dart';
import 'package:luckincoffee/pages/menu/menu.dart';
import 'package:luckincoffee/pages/orders/orders.dart';
import 'package:luckincoffee/pages/cart/cart.dart';
import 'package:luckincoffee/pages/profile/profile.dart';

class AppRoutes {
  static final initialRoute = MainPage.routerName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routerName: (ctx) => MainPage(),
    HomePage.routerName: (ctx) => HomePage(),
    MenuPage.routerName: (ctx) => MenuPage(),
    OrdersPage.routerName: (ctx) => OrdersPage(),
    CartPage.routerName: (ctx) => CartPage(),
    ProfilePage.routerName: (ctx) => ProfilePage(),
  };
}
