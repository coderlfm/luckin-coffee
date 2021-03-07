import 'package:flutter/material.dart';

import 'package:luckincoffee/extensions/int-extensions.dart';
import 'package:luckincoffee/model/menu-model.dart';
import 'package:luckincoffee/pages/menu/menu-product.dart';
import 'package:luckincoffee/utils/hex-color.dart';
import 'package:luckincoffee/view-model/product-view-model.dart';
import 'package:provider/provider.dart';

class MenuContentProducts extends StatefulWidget {
  @override
  _MenuContentProductsState createState() => _MenuContentProductsState();
}

class _MenuContentProductsState extends State<MenuContentProducts> {
  String _currentSelect = '';

  /// 渲染头部 tips
  Widget buildProductCategoryTips({required String name, required String nameColor, required String bgColor}) {
    return Positioned(
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.px, horizontal: 7.px),
        decoration: BoxDecoration(
          color: HexColor(bgColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.px),
            bottomRight: Radius.circular(8.px),
          ),
        ),
        child: Text(
          name,
          style: Theme.of(context).textTheme.headline1?.copyWith(color: HexColor(nameColor), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildbuildProductCategoryRound() {
    return Positioned(
      left: -20.px,
      child: Image.asset(
        'lib/assets/images/menu/round-top-left.png',
        width: 40.px,
        height: 40.px,
      ),
    );
  }

  /// 渲染左侧商品菜单
  Widget buildProductCategory(MenuModel prod) {
    final List<Widget> prodCategory = [
      Padding(
        padding: EdgeInsets.fromLTRB(13.px, 15.px, 0, 15.px),
        child: Text(prod.kindName),
      ),
    ];

    final bool isActive = _currentSelect == prod.kindId; // 是否选中

    /// 校验是否需要渲染tips
    if (prod.timeDiscountInfo != null) {
      prodCategory.add(buildProductCategoryTips(
        name: prod.timeDiscountInfo!.name,
        bgColor: prod.timeDiscountInfo!.bgColor,
        nameColor: prod.timeDiscountInfo!.nameColor,
      ));
    }

    if (isActive) {
      prodCategory.add(buildbuildProductCategoryRound());
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentSelect = prod.kindId;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 10.px),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.px),
          color: isActive ? Colors.white : Colors.transparent,
        ),
        child: Stack(children: prodCategory),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// 获取初始选中项
    String initCurrentId = '';

    if (Provider.of<ProductViewModel>(context).products.length != 0) {
      initCurrentId = Provider.of<ProductViewModel>(context).products[0].kindId;
    }

    setState(() {
      print('initCurrentId:$initCurrentId');
      _currentSelect = _currentSelect == '' ? initCurrentId : _currentSelect;
    });

    return Consumer<ProductViewModel>(
      builder: (ctx, prodVM, chind) {
        final prods = prodVM.products;
        return Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // height: 400.px,
                width: 100.px,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: prods.length,
                  itemBuilder: (ctx, index) => buildProductCategory(prods[index]),
                ),
              ),
              SizedBox(width: 5.px),
              Expanded(
                child: Container(
                  // height: 400,
                  margin: EdgeInsets.only(right: 10.px),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.px),
                    color: Colors.white,
                  ),
                  child: MenuProduct(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
