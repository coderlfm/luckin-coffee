import 'package:flutter/cupertino.dart';
import 'package:luckincoffee/model/tide-banner-model.dart';
import 'package:luckincoffee/model/tide-model.dart';
import 'package:luckincoffee/services/tide.dart';

class TideViewModel extends ChangeNotifier {
  ///潮品轮播图数据
  List<TideBannerModel> _tideBannerData = [];

  /// 潮品数据
  List<TideModel> _tideData = [];

  List<TideBannerModel> get tideBannerData => _tideBannerData;
  List<TideModel> get tideData => _tideData;

  set tideBannerData(List<TideBannerModel> tidbans) {
    _tideBannerData = tidbans;
    notifyListeners();
  }

  set tideData(List<TideModel> tideData) {
    _tideData = tideData;
    notifyListeners();
  }

  TideViewModel() {
    /// 获取轮播图数据
    TideRequest.getTideBannerData().then((res) {
      print('轮播图数据: $res');
      tideBannerData = res;
    });

    /// 获取潮品数据
    TideRequest.getTideData().then((res) {
      print('潮品数据: $res');
      tideData = res;
    });
  }
}
