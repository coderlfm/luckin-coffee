import 'package:flutter/material.dart';
import 'package:luckincoffee/pages/home/home-content.dart';
import 'package:luckincoffee/pages/home/home-swiper.dart';

class HomePage extends StatelessWidget {
  static const String routerName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeContent(),
    );
  }
}
