import 'package:flutter/material.dart';
import 'package:luckincoffee/model/menu-scroll.dart';
import 'package:provider/provider.dart';

import 'package:luckincoffee/extensions/int-extensions.dart';
import 'package:luckincoffee/model/menu-model.dart';
import 'package:luckincoffee/utils/hex-color.dart';
import 'package:luckincoffee/view-model/product-view-model.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'menu-product-item.dart';
import 'package:luckincoffee/utils/event-bus.dart';

class MenuProduct extends StatefulWidget {
  @override
  _MenuProductState createState() => _MenuProductState();
}

class _MenuProductState extends State<MenuProduct> {
  // final _listViewController = ScrollController();

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  void jump() {
    // _listViewController
  }

  @override
  void initState() {
    super.initState();
    eventBus.on<MenuScroll>().listen((event) {
      itemScrollController.scrollTo(index: event.index, duration: Duration(milliseconds: 400));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ProductViewModel, ProductViewModel>(
      builder: (ctx, prodVM, child) {
        return ScrollablePositionedList.builder(
          itemCount: prodVM.products.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(8.px),
            child: MenuProuctGroup(prodVM.products[index]),
          ),
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
        );
      },
      selector: (ctx, prodVM) => prodVM,
      shouldRebuild: (prev, next) => prev.products.length != next.products.length,
    );
  }
}

class MenuProuctGroup extends StatefulWidget {
  late final MenuModel prod;

  MenuProuctGroup(this.prod);

  @override
  _MenuProuctGroupState createState() => _MenuProuctGroupState();
}

class _MenuProuctGroupState extends State<MenuProuctGroup> {
  final Color secondColor = Color(0xffaaaaaa);

  /// ???????????????????????????
  bool _isShowSellOut = false;

  /// ????????????????????????
  Widget buildHeader(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.prod.kindName,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          widget.prod.kindDesc,
          style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.bold, color: secondColor),
        ),
        if (widget.prod.advertisingInfo != null)
          Padding(
            padding: EdgeInsets.only(top: 15.px, bottom: 5.px),
            child: Image.network(widget.prod.advertisingInfo!.sourceUrl),
          ),
      ],
    );
  }

  /// ?????????????????????
  Widget buildProductList(BuildContext context, TwoProductList tProd) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tProd.twoKindId == '-1' ? '?????????' : tProd.twoKindName,
              style: Theme.of(context).textTheme.headline1?.copyWith(color: secondColor, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            if (tProd.twoKindId == '-1' && tProd.productList.length > 2) buildSellOutTips(tProd, context)
          ],
        ),
        buildProductGroup(tProd),
      ],
    );
  }

  /// ???????????????????????????
  Padding buildSellOutTips(TwoProductList tProd, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.px),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isShowSellOut = !_isShowSellOut;
          });
        },
        child: Row(
          children: [
            Text('???${tProd.productList.length}?????????', style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.bold, color: secondColor)),
            SizedBox(width: 10.px),
            Container(
              height: 16.px,
              child: Image.asset(
                'lib/assets/images/menu/arrow_down_blue.png',
                width: 10.px,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ?????????????????????????????????????????????
  Widget buildProductGroup(TwoProductList tProd) {
    if (tProd.twoKindId == '-1' && !_isShowSellOut) {
      /// TODO: ?????? ??????????????????????????????????????????
      return Opacity(
        opacity: .3,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.px),
          child: MenuProductItem(prod: tProd.productList[0], isSellOut: true),
        ),
      );
    } else if (tProd.twoKindId == '-1' && _isShowSellOut) {
      return Opacity(
        opacity: .3,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 15.px),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: tProd.productList.length,
          itemBuilder: (ctx, index) => MenuProductItem(prod: tProd.productList[index], isSellOut: true),
          separatorBuilder: (ctx, index) => Divider(),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 15.px),
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: tProd.productList.length,
      itemBuilder: (ctx, index) => MenuProductItem(prod: tProd.productList[index], isSellOut: tProd.twoKindId == '-1'),
      separatorBuilder: (ctx, index) => Divider(),
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
          itemCount: widget.prod.twoProductList.length,
          itemBuilder: (ctx, index) => buildProductList(context, widget.prod.twoProductList[index]),
        ),
      ],
    );
  }
}
