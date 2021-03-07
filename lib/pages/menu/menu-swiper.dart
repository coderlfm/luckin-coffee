import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:luckincoffee/extensions/int-extensions.dart';

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

class MenuSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('lib/assets/images/menu/banner-bg.png'),
        fit: BoxFit.cover,
      )),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.px, 30.px, 10.px, 10.px),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.px),
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
      ),
    );
  }
}
