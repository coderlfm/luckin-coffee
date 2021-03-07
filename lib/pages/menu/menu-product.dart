import 'package:flutter/material.dart';

import 'package:luckincoffee/extensions/int-extensions.dart';
import 'package:luckincoffee/model/menu-model.dart';
import 'package:luckincoffee/view-model/product-view-model.dart';
import 'package:provider/provider.dart';

class MenuProduct extends StatelessWidget {
  // final

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
          itemBuilder: (ctx, index) => buildProductItem(context, tProd.productList[index]),
          separatorBuilder: (ctx, index) => Divider(),
        )
      ],
    );
  }

  /// 构建子分组商品 item
  Widget buildProductItem(BuildContext context, ProductList prod) {
    return Container(
      height: 70.px,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.px),
                child: Image.network(
                  prod.defaultPicUrl,
                  width: 60.px,
                  height: double.infinity,
                ),
              ),
              Positioned(
                right: -5.px,
                bottom: 10.px,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.px, horizontal: 2.px),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.px),
                    color: Color(0xff6268DB),
                  ),
                  child: Text(
                    '${prod.promotionMsg}',
                    style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 6.px),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                prod.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                prod.enName,
                style: Theme.of(context).textTheme.headline1?.copyWith(color: secondColor, fontWeight: FontWeight.bold),
              ),
              Text(
                prod.skuName,
                style: Theme.of(context).textTheme.headline1?.copyWith(color: secondColor, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '￥${prod.discountPrice.toInt()}',
                        style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.orangeAccent),
                      ),
                      Text(
                        '￥${prod.initialPrice}',
                        style: Theme.of(context).textTheme.headline1?.copyWith(color: secondColor, fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough, decorationColor: secondColor),
                      ),
                    ],
                  ),
                  Container(
                    height: 14.px,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add),
                      onPressed: () {},
                      iconSize: 14.px,
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
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
