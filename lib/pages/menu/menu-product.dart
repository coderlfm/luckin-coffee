import 'package:flutter/material.dart';

import 'package:luckincoffee/extensions/int-extensions.dart';
import 'package:luckincoffee/model/menu-model.dart';
import 'package:luckincoffee/utils/hex-color.dart';
import 'package:luckincoffee/view-model/product-view-model.dart';
import 'package:provider/provider.dart';

import 'menu-product-item.dart';

class MenuProduct extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Selector<ProductViewModel, ProductViewModel>(
      builder: (ctx, prodVM, child) {
        // bool isEmpty = prodVM.products.length == 0;

        return ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: prodVM.products.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (ctx, index) => Padding(
            padding: EdgeInsets.all(8.px),
            child: MenuProuctGroup(prodVM.products[index]),
          ),
          separatorBuilder: (ctx, index) => Divider(),
        );
      },
      selector: (ctx, prodVM) => prodVM,
      shouldRebuild: (prev, next) => prev.products.length != next.products.length,
    );
  }
}

class MenuProuctGroup extends StatelessWidget {
  late final MenuModel prod;

  final Color secondColor = Color(0xffaaaaaa);

  MenuProuctGroup(this.prod);

  /// 构建商品分类头部
  Widget buildHeader(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          prod.kindName,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          prod.kindDesc,
          style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.bold, color: secondColor),
        ),
        if (prod.advertisingInfo != null)
          Padding(
            padding: EdgeInsets.only(top: 15.px, bottom: 5.px),
            child: Image.network(prod.advertisingInfo!.sourceUrl),
          ),
      ],
    );
  }

  /// 构建子分组商品
  Widget buildProductList(BuildContext context, TwoProductList tProd) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tProd.twoKindName, style: Theme.of(context).textTheme.headline1?.copyWith(color: secondColor, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 15.px),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: tProd.productList.length,
          itemBuilder: (ctx, index) => MenuProductItem(tProd.productList[index]),
          separatorBuilder: (ctx, index) => Divider(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(context),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: prod.twoProductList.length,
          itemBuilder: (ctx, index) => buildProductList(context, prod.twoProductList[index]),
        ),
      ],
    );
  }
}
