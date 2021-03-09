import 'package:flutter/material.dart';
import 'package:luckincoffee/model/tide-model.dart';
import 'package:luckincoffee/model/tide-banner-model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:luckincoffee/view-model/tide-view-model.dart';
import 'package:luckincoffee/extensions/int-extensions.dart';

class TideContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Selector<TideViewModel, TideViewModel>(
        selector: (ctx, tiVM) => tiVM,
        shouldRebuild: (prev, next) {
          // print('${prev.tideBannerData.length}  ${prev.tideData.length}  ${next.tideBannerData.length}  ${next.tideData.length}');

          /// TODO: 此处判断有点问题
          // return (prev.tideBannerData.length != next.tideBannerData.length || prev.tideData.length != next.tideData.length);
          return next.tideBannerData.length != 0 || next.tideData.length != 0;
        },
        builder: (ctx, tiVM, child) {
          final tidata = tiVM.tideData;
          final tiBanners = tiVM.tideBannerData;

          print('tiBanners:${tiBanners}');

          if (tidata.length != 0 && tiBanners.length != 0) {
            return Column(
              children: [
                buildSwiper(tidata, tiBanners),
              ],
            );
          }

          return Center(child: Text('暂无数据'));
        },
      ),
    );
  }

  /// 构建 swiper
  Stack buildSwiper(List<TideModel> tidata, List<TideBannerModel> tiBanners) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.zero,
          width: double.infinity,
          height: 190.px,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(tidata[0].backGroundUrl), fit: BoxFit.cover)),
        ),
        Container(
          height: 200.px,
          padding: EdgeInsets.fromLTRB(10.px, 20.px, 10.px, 0.px),
          child: Swiper(
            index: 0,
            itemCount: tiBanners.length,
            itemBuilder: (ctx, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15.px),
                child: Image.network(tiBanners[index].sourceUrl),
              );
            },
            pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(size: 8, activeSize: 8)),
            autoplay: true,
            duration: 300,
            autoplayDelay: 5000,
          ),
        ),
      ],
    );
  }
}
