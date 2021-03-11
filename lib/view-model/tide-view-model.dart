import 'package:flutter/cupertino.dart';
import 'package:luckincoffee/model/tide-banner-model.dart';
import 'package:luckincoffee/model/tide-model.dart';
import 'package:luckincoffee/services/tide.dart';

class TideViewModel extends ChangeNotifier {
  static int homePage = 1;

  ///潮品轮播图数据
  List<TideBannerModel> _tideBannerData = [];

  /// 潮品数据
  List<TideModel> _tideData = [];

  /// 潮品商品更多数据
  List<CommodityList> _tideProductData = [];

  List<TideBannerModel> get tideBannerData => _tideBannerData;
  List<TideModel> get tideData => _tideData;
  List<CommodityList> get tideProductData => _tideProductData;

  set tideBannerData(List<TideBannerModel> tidbans) {
    _tideBannerData = tidbans;
    notifyListeners();
  }

  set tideData(List<TideModel> tideData) {
    _tideData = tideData;
    notifyListeners();
  }

  set tideProductData(List<CommodityList> tideProductData) {
    _tideProductData = tideProductData;
    notifyListeners();
  }

  TideViewModel() {
    tideInitData();
  }

  /// 初始化数据
  void tideInitData() {
    /// 获取轮播图数据
    TideRequest.getTideBannerData().then((res) {
      print('轮播图数据: $res');
      tideBannerData = res;
    });

    getTideData();
  }

  /// 获取潮品数据
  Future getTideData() async {
    /// 获取潮品数据
    if (homePage == 1) {
      final res = await TideRequest.getTideData(page: homePage);
      print('潮品数据: $res');
      tideData = res;
    } else {
      final res = await TideRequest.getTideProductData(page: homePage);
      tideProductData = res;
    }

    homePage++;
    return Future.value();
  }
}
