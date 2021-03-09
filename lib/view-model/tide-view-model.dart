import 'package:flutter/cupertino.dart';
import 'package:luckincoffee/model/tide-model.dart';
import 'package:luckincoffee/services/tide.dart';

class TideViewModel extends ChangeNotifier {
  final List<TideModel> tideData = [];

  TideViewModel(String name) {
    TideRequest.getTideBannerData().then((res) => {print('res:$res')});
  }
}
