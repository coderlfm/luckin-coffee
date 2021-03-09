import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:luckincoffee/view-model/tide-view-model.dart';
import 'package:provider/provider.dart';

class TideContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Consumer<TideViewModel>(
            builder: (ctx, tiVM, child) {
              return Text('tiVM');
            },
          )
          //  Swiper(
          //   index: 0,
          //   itemCount: banners.length,
          //   itemBuilder: (ctx, index) => banners[index],
          //   pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(size: 8, activeSize: 8)),
          //   autoplay: true,
          //   duration: 500,
          //   autoplayDelay: 5000,
          // ),
        ],
      ),
    );
  }
}
