import 'package:flutter/material.dart';

import 'package:luckincoffee/extensions/int-extensions.dart';
import 'package:luckincoffee/pages/menu/menu-content-products.dart';
import 'package:luckincoffee/pages/menu/menu-swiper.dart';
import 'package:luckincoffee/services/menu.dart';

class MenuContent extends StatefulWidget {
  @override
  _MenuContentState createState() => _MenuContentState();
}

class _MenuContentState extends State<MenuContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180.px,
          child: MenuSwiper(),
        ),
        MenuContentProducts(),
      ],
    );
  }
}
