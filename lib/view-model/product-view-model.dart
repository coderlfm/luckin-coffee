import 'package:flutter/cupertino.dart';
import 'package:luckincoffee/model/menu-model.dart';
import 'package:luckincoffee/services/menu.dart';

class ProductViewModel extends ChangeNotifier {
  /// 商品列表
  List<MenuModel> _products = [];

  ProductViewModel() {
    MenuRequest.getProductList().then((res) {
      products = res;
    });
  }

  set products(List<MenuModel> prod) {
    _products = prod;
    notifyListeners();
  }

  List<MenuModel> get products => _products;
}
