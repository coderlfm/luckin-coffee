import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:luckincoffee/model/tide-model.dart';
import 'package:luckincoffee/extensions/int-extensions.dart';
import 'package:luckincoffee/view-model/tide-view-model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TideProducts extends StatelessWidget {
  late final List<CommodityList> products;

  TideProducts(this.products);

  @override
  Widget build(BuildContext context) {
    return Selector<TideViewModel, TideViewModel>(
      selector: (ctx, tiVM) => tiVM,
      shouldRebuild: (prev, next) {
        return next.tideBannerData.length != 0 || next.tideData.length != 0;
      },
      builder: (ctx, tiVM, child) {
        final tiProddata = tiVM.tideProductData;

        final List<CommodityList> prods = [...products, ...tiProddata];

        return StaggeredGridView.countBuilder(
          crossAxisCount: 4, //横轴单元格数量
          itemCount: prods.length, //元素数量
          physics: ScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 8.px),
          mainAxisSpacing: 8.px,
          crossAxisSpacing: 8.px,
          itemBuilder: (context, index) => buildProductItem(prods[index], context),
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        );
      },
    );
  }

  /// 构建商品 item
  Container buildProductItem(CommodityList prod, BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.px)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(8.px), topRight: Radius.circular(8.px)), child: Image.network(prod.defaultPicUrl)),
          buildProductInfo(prod, context),
        ],
      ),
    );
  }

  /// 构建商品信息
  Padding buildProductInfo(CommodityList prod, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.px, right: 8.px, bottom: 8.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3.px),

          Text(
            prod.name,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6.px),

          /// 构建 价格
          Row(
            children: [
              Text(
                '￥${prod.salePrice}',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffD95C25)),
              ),
              SizedBox(width: 5.px),
              Text(
                '￥${prod.price}',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff999999),
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
            ],
          ),

          /// 特卖标签
          if (prod.baseTagList.length != 0)
            Container(
              padding: EdgeInsets.all(2.px),
              margin: EdgeInsets.symmetric(vertical: 3.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.px),
                color: Color(0xffD95C25),
              ),
              child: Text(
                prod.baseTagList[0],
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.white,

                      // backgroundColor: Color(0xffD95C25),
                    ),
              ),
            ),

          /// 底部 加购图标
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '已售卖${prod.alreadySellNumber}件',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff999999),
                    ),
              ),
              Image.asset(
                'lib/assets/images/tide/icon_home_pop_add_cart.png',
                width: 18.px,
              )
            ],
          )
        ],
      ),
    );
  }
}
