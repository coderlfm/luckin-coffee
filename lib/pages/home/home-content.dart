import 'package:flutter/material.dart';
import 'package:luckincoffee/extensions/int-extensions.dart';
import 'package:luckincoffee/utils/icon.dart';

import 'home-swiper.dart';

final List<SelectItemViewModel> selects = [
  SelectItemViewModel(
    title: '立即下单',
    subtitle: 'ORDER NOW',
    iconData: IconFonts.icontupian3,
  ),
  SelectItemViewModel(
    title: '咖啡钱包',
    subtitle: 'COFFEE WALLET',
    iconData: IconFonts.icontupian,
  ),
  SelectItemViewModel(
    title: '送Ta咖啡',
    subtitle: 'SEND COFFEE',
    iconData: IconFonts.icontupian1,
  ),
  SelectItemViewModel(
    title: '企业账户',
    subtitle: 'ENTERPRISE ACCOUNT',
    iconData: IconFonts.icontupian7,
  ),
];

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  /// 购买类型
  /// 1：自提
  /// 2：外送
  int type = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      HomeSwiper(),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 20.px),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('青年汇店'),
                subtitle: Text('距你53m'),
                trailing: buildTrailing(context),
              ),
              buildSelects(),
              buildFooterImg(),
            ],
          )),
    ]);
  }

  /// 渲染右侧购买类型
  Widget buildTrailing(BuildContext context) {
    /// 修改购买类型
    void handleTypeChange() {
      setState(() {
        type = type == 0 ? 1 : 0;
      });
    }

    return Container(
      width: 90.px,
      height: 36.px,
      padding: EdgeInsets.all(2.px),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(100.px),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildTrailingItem(context: context, title: '自提', isActive: type == 0, onTap: handleTypeChange),
          buildTrailingItem(context: context, title: '外送', isActive: type == 1, onTap: handleTypeChange),
        ],
      ),
    );
  }

  /// 渲染购买类型
  Widget buildTrailingItem({required BuildContext context, required String title, required bool isActive, required Function onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.px), color: isActive ? Theme.of(context).primaryColor : Colors.transparent),
          alignment: Alignment(0, 0),
          child: Text(title, style: Theme.of(context).textTheme.headline1?.copyWith(color: isActive ? Colors.white : Colors.black87)),
        ),
      ),
    );
  }

  Widget buildSelects() {
    return Container(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: selects.length,
        itemBuilder: (ctx, index) {
          return buildSelectsItem(title: selects[index].title, subtitle: selects[index].subtitle, iconData: selects[index].iconData);
        },
        separatorBuilder: (ctx, index) => Divider(),
      ),
    );
  }

  /// 渲染底部选择菜单
  Widget buildSelectsItem({
    required String title,
    required String subtitle,
    required IconData iconData,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
      ),
      trailing: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(100)),
              child: Icon(
                iconData,
                color: Color(0xff64443c),
              ))),
    );
  }

  /// 渲染底部图片
  Image buildFooterImg() {
    return Image.asset(
      'lib/assets/images/home/footer-img.png',
      fit: BoxFit.cover,
    );
  }
}

/// 菜单 item 数据模型
class SelectItemViewModel {
  late final String title;
  late final String subtitle;
  late final IconData iconData;

  SelectItemViewModel({required this.title, required this.subtitle, required this.iconData});
}
