import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:luckincoffee/extensions/int-extensions.dart';
import 'package:luckincoffee/utils/icon.dart';

final List<Image> banners = [
  Image.asset(
    'lib/assets/images/home/banner-1.jpg',
    fit: BoxFit.cover,
  ),
  Image.asset(
    'lib/assets/images/home/banner-2.jpg',
    fit: BoxFit.cover,
  ),
  Image.asset(
    'lib/assets/images/home/banner-3.jpg',
    fit: BoxFit.cover,
  ),
];

class HomeSwiper extends StatefulWidget {
  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 208.px,
      child: Stack(
        children: [
          Swiper(
            index: 0,
            itemCount: banners.length,
            itemBuilder: (ctx, index) => banners[index],
            pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(size: 8, activeSize: 8)),
            autoplay: true,
            duration: 500,
            autoplayDelay: 5000,
          ),
          Positioned(
            child: CircleAvatar(
                backgroundColor: Colors.black26,
                child: Icon(
                  IconFonts.icontupian4,
                  color: Colors.white,
                  size: 20,
                )),
            right: 20,
            top: 60,
          )
        ],
      ),
    );
  }
}
