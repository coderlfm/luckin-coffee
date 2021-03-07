import 'package:flutter/material.dart';

import 'package:luckincoffee/extensions/int-extensions.dart';
import 'package:luckincoffee/model/menu-model.dart';
import 'package:luckincoffee/utils/hex-color.dart';

class MenuProductItem extends StatelessWidget {
  /// 商品对象
  late final ProductList prod;

  /// 次级文字颜色
  final Color secondColor = Color(0xffaaaaaa);

  MenuProductItem(this.prod);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.px,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImg(context),
          SizedBox(width: 6.px),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildTitle(context), buildInfo(context)],
          ))
        ],
      ),
    );
  }

  /// 构建商品图片
  Stack buildImg(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.px),
          child: Image.network(
            prod.defaultPicUrl,
            // width: 60.px,
            height: double.infinity,
          ),
        ),
        if (prod.promotionMsg != null)
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
                style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white),
              ),
            ),
          )
      ],
    );
  }

  /// 构建 商品描述信息
  Row buildInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '￥${prod.discountPrice.toInt()}',
              style: Theme.of(context).textTheme.headline2?.copyWith(color: Color(0xffD4660C), letterSpacing: -2),
            ),
            SizedBox(width: 3.px),
            Text(
              '￥${prod.initialPrice}',
              style: Theme.of(context).textTheme.headline1?.copyWith(color: secondColor, fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough, decorationColor: secondColor),
            ),
          ],
        ),
        Container(
          height: 16.px,
          child: FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Color(0xff7082B1),
            // padding: EdgeInsets.zero,
            child: Icon(
              Icons.add,
              size: 16.px,
              color: Colors.white,
            ),
            onPressed: () {},
            // iconSize: 14.px,
          ),
        ),
      ],
    );
  }

  /// 构建头部
  Column buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              prod.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            if (prod.tagList != null) ...buildTitleTag(context)
          ],
        ),
        Text(
          prod.enName,
          style: Theme.of(context).textTheme.headline1?.copyWith(
                color: secondColor,
                fontWeight: FontWeight.bold,
              ),
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          prod.skuName,
          style: Theme.of(context).textTheme.headline1?.copyWith(color: secondColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// 构建头部 tag
  List<Widget> buildTitleTag(BuildContext context) {
    return List.generate(
      prod.tagList!.length,
      (index) {
        final tag = prod.tagList![index];

        if (tag.pictureUrl != null) {
          return Image.network(
            tag.pictureUrl,
            width: 24.px,
            // height: 10.px,
          );
        }
        return Container(
          margin: EdgeInsets.only(left: 3.px),
          padding: EdgeInsets.symmetric(vertical: 1.px, horizontal: 2.px),
          decoration: BoxDecoration(
            color: HexColor(tag.bgColor),
            borderRadius: BorderRadius.circular(2.px),
          ),
          child: Text(
            '${tag.content}',
            style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
