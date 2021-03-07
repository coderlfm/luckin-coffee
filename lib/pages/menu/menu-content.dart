import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:luckincoffee/extensions/int-extensions.dart';
import 'package:luckincoffee/services/menu.dart';

final List<Image> banners = [
  Image.asset(
    'lib/assets/images/menu/banner-1.jpg',
    fit: BoxFit.cover,
  ),
  Image.asset(
    'lib/assets/images/menu/banner-2.jpg',
    fit: BoxFit.cover,
  ),
];

class MenuContent extends StatefulWidget {
  @override
  _MenuContentState createState() => _MenuContentState();
}

class _MenuContentState extends State<MenuContent> {
  Widget buildMain() {
    return Expanded(
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.px),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 8.px),
                  child: Text('人气 TOP'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 8.px),
                child: Text('经典拿铁'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 8.px),
                child: Text('大师咖啡'),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: 400,
              child: ListView.separated(
                itemCount: 30,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (ctx, index) => Padding(
                  padding: EdgeInsets.all(8.px),
                  child: Text('咖啡$index'),
                ),
                separatorBuilder: (ctx, index) => Divider(),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    MenuRequest.getProductList().then((value) => print('value：$value'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 150.px,
        child: Swiper(
          index: 0,
          itemCount: banners.length,
          itemBuilder: (ctx, index) => banners[index],
          pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(size: 8, activeSize: 8)),
          autoplay: true,
          duration: 500,
          autoplayDelay: 5000,
        ),
      ),
      buildMain(),
      Center(
        child: Text('菜单'),
      ),
    ]);
  }
}
