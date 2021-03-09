import 'dart:convert';

import 'package:luckincoffee/model/menu-model.dart';
import 'package:luckincoffee/services/request.dart';

class MenuRequest {
  static Future<List<MenuModel>> getProductList() async {
    final resStr = await HttpRequest.lcRequest('product/list/static?deptId=119901&platform=1&cid=220101&appversion=4400');
    // print('res: $resStr');
    final res = json.decode(resStr);
    final productsRes = res['content']['commodityList'] as List<dynamic>;

    if (res['code'] == 1) {
      // print('请求成功');
    }
    return menuModelFromJson(productsRes);
  }
}
