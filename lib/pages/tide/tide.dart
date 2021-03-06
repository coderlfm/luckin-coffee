import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckincoffee/pages/tide/tide-content.dart';
import 'package:luckincoffee/view-model/tide-view-model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:luckincoffee/extensions/int-extensions.dart';

class TidePage extends StatefulWidget {
  static String routerName = '/tide';
  @override
  _TidePageState createState() => _TidePageState();
}

class _TidePageState extends State<TidePage> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh(BuildContext context) async {
    TideViewModel tideVM = Provider.of<TideViewModel>(context, listen: false);
    await tideVM.tideInitData();
    _refreshController.refreshCompleted();
  }

  void _onLoading(BuildContext context) async {
    TideViewModel tideVM = Provider.of<TideViewModel>(context, listen: false);

    /// 上拉加载更多潮品数据
    final res = await tideVM.getTideData();
    print('res:${res}');
  
    /// TODO: 此处需要设置成已加载完毕
    if (res > 0) {
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多!");
            } else {
              body = Text("没有更多啦~");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: () => _onRefresh(context),
        onLoading: () => _onLoading(context),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: [TideContent()],
            ),
            Positioned(
              right: 10.px,
              bottom: 80.px,
              child: Image.asset('lib/assets/images/tide/icon_arrow_back_to_top.png'))
            
          ],
        ),
      ),
    );
  }
}
