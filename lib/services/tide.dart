import 'dart:convert';

import 'package:luckincoffee/model/tide-banner-model.dart';
import 'package:luckincoffee/model/tide-model.dart';
import 'package:luckincoffee/services/request.dart';

class TideRequest {
  /// 获取轮播图
  static Future<List<TideBannerModel>> getTideBannerData() async {
    final resStr = await HttpTickRequest.lcRequest('sys/app/adpos?width=1065&height=510&appVersion=4400&brandType=LK001&source=3&displayLocation=4&_=1615200110497');

    final bannerlistRes = resStr['content'] as List<dynamic>;

    final List<TideBannerModel> bannerlist = [];
    bannerlistRes.forEach((item) {
      bannerlist.add(TideBannerModel(
        alipayIsAuthorization: item['alipayIsAuthorization'],
        alipayNeedAuthorization: item['alipayNeedAuthorization'],
        clickUrl: item['clickUrl'],
        externalLink: item['externalLink'],
        imageSize: item['imageSize'],
        isLogin: item['isLogin'],
        needAuthorization: item['needAuthorization'],
        origin: item['origin'],
        positionCode: item['positionCode'],
        selectColor: item['selectColor'],
        selectedSourceUrl: item['selectedSourceUrl'],
        shareCardImg: item['shareCardImg'],
        shareRemark: item['shareRemark'],
        sortId: item['sortId'],
        sourceType: item['sourceType'],
        sourceUrl: item['sourceUrl'],
        timeStamp: item['timeStamp'],
        title: item['title'],
        type: item['type'],
        unSelectColor: item['unSelectColor'],
        wxIsAuthorization: item['wxIsAuthorization'],
      ));
    });
    return bannerlist;
  }

  /// 获取潮品数据
  static Future<List<TideModel>> getTideData({int page = 1}) async {
    dynamic resStr;

    resStr = await HttpTickRequest.lcRequest('eorder/page/queryShowInformation?brandType=LK001&origin=4&preView=0&homePage=1&_=1615276251389');

    return tideModelFromMap(resStr['content']['pageComponents']);
  }

  /// 获取潮品数据
  static Future<List<CommodityList>> getTideProductData({int page = 2}) async {
    dynamic resStr;

    resStr = await HttpTickRequest.lcRequest('eorder/page/pagingProductList?planNo=SK003&pageNo=$page&brandType=LK001&origin=4&_=1615373903950');

    print('resStr: ${resStr}');

    return List<CommodityList>.from(resStr['content']['commodityList'].map((x) => CommodityList.fromMap(x)));
    // return CommodityList.fromMap(resStr['content']['commodityList']);
  }
}
