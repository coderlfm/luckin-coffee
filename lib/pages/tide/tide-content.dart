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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.px),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,

                      /// 去除背景图
                      itemCount: tidata.length - 1,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return checkBuildType(tidata[index + 1]);
                      }),
                )
              ],
            );
          }

          return Center(child: Text('暂无数据'));
        },
      ),
    );
  }

  /// 校验 构建的 widget 类型
  Widget checkBuildType(TideModel tidata) {
    late Widget widget;

    switch (tidata.componentType) {
      case 2:
        widget = buildImg(tidata.backGroundUrl);
        break;

      case 5:
        widget = buildImg(tidata.backGroundUrl);
        break;

      case 3:
        widget = buildChannel(tidata);
        break;

      default:
        widget = Text('商品组件');
    }

    return widget;
  }

  /// 构建轮播底部图片
  Widget buildImg(String url) => Padding(padding: EdgeInsets.symmetric(vertical: 5.px), child: Image.network(url));

  /// 构建频道
  Widget buildChannel(TideModel tidata) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: tidata.subComponents!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (ctx, index) {
          return Image.network(tidata.subComponents![index].backGroundUrl);
        });
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
