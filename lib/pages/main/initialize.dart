import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:luckincoffee/pages/home/home.dart';
import 'package:luckincoffee/pages/menu/menu.dart';
import 'package:luckincoffee/pages/tide/tide.dart';
import 'package:luckincoffee/pages/cart/cart.dart';
import 'package:luckincoffee/pages/profile/profile.dart';

import 'package:luckincoffee/utils/icon.dart';

final List<BottomNavigationBarItem> tabbar = [
  BottomNavigationBarItem(
    icon: Icon(IconFonts.iconlogo_not_text),
    label: '首页',
  ),
  BottomNavigationBarItem(
    icon: Icon(IconFonts.iconcaidan),
    label: '菜单',
  ),
  BottomNavigationBarItem(
    icon: Icon(IconFonts.iconorder),
    label: '潮品',
  ),
  BottomNavigationBarItem(
    icon: Icon(IconFonts.icongouwuche),
    label: '购物车',
  ),
  BottomNavigationBarItem(
    icon: Icon(IconFonts.iconmine),
    label: '我的',
  ),
];

final List<Widget> pages = [
  TidePage(),
  // HomePage(),
  // MenuPage(),
  // CartPage(),
  // ProfilePage(),
];
