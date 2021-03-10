import 'package:flutter/material.dart';
import 'package:luckincoffee/model/tide-model.dart';
import 'package:luckincoffee/model/tide-banner-model.dart';
import 'package:luckincoffee/pages/tide/tide-products.dart';
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
          return next.tideBannerData.length != 0 || next.tideData.length != 0;
        },
        builder: (ctx, tiVM, child) {
          final tidata = tiVM.tideData;
          final tiBanners = tiVM.tideBannerData;

          print('tiBanners:${tiBanners}');

          if (tidata.length != 0 && tiBanners.length != 0) {
            return Column(
              mainAxisSize: MainAxisSize.min,
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
                        return checkBuildType(context, tidata[index + 1]);
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
  Widget checkBuildType(BuildContext context, TideModel tidata) {
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

      case 14:
        widget = buildFlashSale(context, tidata);
        break;

      case 4:
        widget = buildActivityImg(tidata);
        break;

      case 6:
        widget = buildActivitySection(context, tidata);
        break;

      case 17:
        widget = TideProducts(tidata.commodityList!);
        break;

      default:
        widget = Text('商品组件');
    }

    return widget;
  }

  /// 构建活动板块
  Widget buildActivitySection(BuildContext context, TideModel tidata) {
    final prods = tidata.commodityList!;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.px),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.px),
            child: Image.network(tidata.backGroundUrl),
          ),
          Positioned(
            // bottom: 0,
            child: GridView.builder(
              padding: EdgeInsets.all(10.px),
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: prods.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.px,
                mainAxisExtent: 120.px,
              ),
              itemBuilder: (ctx, index) {
                return buildActivitySectionItem(prods, index, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 构建 活动板块商品 item
  Container buildActivitySectionItem(List<CommodityList> prods, int index, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.px),
        color: Colors.white,
      ),
      height: 150.px,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.px), topRight: Radius.circular(8.px)),
            child: Image.network(prods[index].defaultPicUrl),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.px),
            child: Column(
              children: [
                Text(
                  prods[index].name,
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      '￥${prods[index].disCountPrice.toInt()}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffD95C25)),
                    ),
                    SizedBox(height: 5.px),
                    Text(
                      '￥${prods[index].price.toInt()}',
                      style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough, color: Color(0xff999999)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 构建 活动图片
  Widget buildActivityImg(TideModel tidata) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: tidata.subComponents!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.px,
        mainAxisExtent: 95.px,
      ),
      itemBuilder: (ctx, index) {
        return Image.network(
          tidata.subComponents![index].backGroundUrl,
          height: double.minPositive,
        );
      },
    );
  }

  /// 构建 限时秒杀
  Widget buildFlashSale(BuildContext context, TideModel tidata) {
    /// 当前只构建一条秒杀
    final flashSale = tidata.flashSaleComponentDetailS![0];
    final nowTime = DateTime.now().microsecondsSinceEpoch;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.px, horizontal: 10.px),
      margin: EdgeInsets.symmetric(vertical: 8.px),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.px)),
      child: Column(
        children: [
          Row(
            children: [
              Text('限时秒杀', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(width: 10.px),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(100.px),
                  border: Border.all(color: Colors.red, width: 1.px),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.px),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100.px),
                        // border: Border.all(color: Colors.red, width: 1.px),
                      ),
                      child: Text('距结束', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white)),
                    ),
                    Text('${DateTime.fromMicrosecondsSinceEpoch((flashSale.endTimeCountdown * 1000 * 1000) - nowTime)}', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
          buildFlashSaleList(flashSale, context)
        ],
      ),
    );
  }

  /// 构建限时秒杀商品列表
  Container buildFlashSaleList(FlashSaleComponentDetail flashSale, BuildContext context) {
    return Container(
      height: 120.px,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: flashSale.commodityList.length,
        itemBuilder: (ctx, index) {
          final fsItem = flashSale.commodityList[index];
          return Container(
            width: 100.px,
            padding: EdgeInsets.only(top: 10.px, right: 10.px),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.px),
                      topRight: Radius.circular(5.px),
                    ),
                    child: Image.network(fsItem.defaultPicUrl)),
                SizedBox(height: 5.px),
                Text(
                  fsItem.name,
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.px),
                Row(
                  children: [
                    Text('￥${fsItem.skillPrice}', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold, color: Color(0xffC11C2B))),
                    Text(
                      '￥${fsItem.price}',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff999999),
                            decoration: TextDecoration.lineThrough,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
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
