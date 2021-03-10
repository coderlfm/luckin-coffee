import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckincoffee/pages/tide/tide-content.dart';
import 'package:luckincoffee/view-model/tide-view-model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TidePage extends StatefulWidget {
  static String routerName = '/tide';
  @override
  _TidePageState createState() => _TidePageState();
}

class _TidePageState extends State<TidePage> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading(BuildContext context) async {
    TideViewModel tideVM = Provider.of<TideViewModel>(context, listen: false);

    await tideVM.getTideData();

    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    print('刷新');
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
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
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: () => _onLoading(context),
        child: ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: [TideContent()],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:luckincoffee/widget/lodemore/base/loading_empty_indicator.dart';
// import 'package:luckincoffee/widget/lodemore/base/loading_indicator.dart';
// import 'package:luckincoffee/widget/lodemore/base/loading_more_base.dart';
// import 'package:luckincoffee/widget/lodemore/bean/Model.dart';
// // import 'package:luckincoffee/widget/loadmore/base/loading_empty_indicator.dart';
// // import 'package:luckincoffee/widget/loadmore/base/loading_indicator.dart';
// // import 'package:luckincoffee/widget/loadmore/base/loading_more_base.dart';
// // import 'package:luckincoffee/widget/loadmore/bean/Model.dart';

// /// 上拉加载更多
// class TidePage extends StatefulWidget {
//   static String routerName = '/tide';

//   @override
//   _TidePageState createState() => _TidePageState();
// }

// class _TidePageState extends State<TidePage> with AutomaticKeepAliveClientMixin {
//   /// 数据加载类
//   late _DataLoader _loader;

//   @override
//   bool get wantKeepAlive => true;

//   @override
//   void initState() {
//     _loader = _DataLoader(1);
//     _loader.obtainData(false);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _loader.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text('加载更多示例'),
//       ),
//       body: StreamBuilder<DataLoadMoreBase<Article, Model>>(
//           stream: _loader.stream,
//           builder: (context, snapshot) {
//             /// 监听滑动结束广播
//             return NotificationListener<ScrollEndNotification>(
//                 onNotification: (notification) {
//                   if (notification.depth != 0) return false;
//                   if (notification.metrics.axisDirection != AxisDirection.down) return false;
//                   if (notification.metrics.pixels < notification.metrics.maxScrollExtent) return false;

//                   /// 如果没有更多, 服务返回错误信息, 网络异常,那么不允许上拉加载更多
//                   if (snapshot.data == null || !snapshot.data!.hasMore() || snapshot.data!.hasError || snapshot.data!.hasException) return false;

//                   // 加载更多
//                   _loader.obtainData(false);
//                   return false;
//                 },

//                 /// 下拉刷新
//                 child: RefreshIndicator(
//                   child: _buildList(snapshot.data!),
//                   onRefresh: () => _loader.obtainData(true),
//                 ));
//           }),
//     );
//   }

//   Widget _buildList(DataLoadMoreBase<Article, Model> dataLoader) {
//     /// 初始化时显示的View
//     if (dataLoader == null) {
//       return Container(
//         child: Center(child: new Text('欢迎光临...')),
//       );
//     }

//     /// 没有数据时候显示的View构建
//     if (!dataLoader.hasData) {
//       return LoadingEmptyIndicator(dataLoader: dataLoader);
//     }

//     /// 渲染数据 ,这里数据+1 1表示最后一项,用于显示加载状态
//     return ListView.separated(
//       itemCount: dataLoader.length + 1,
//       physics: const AlwaysScrollableScrollPhysics(),
//       separatorBuilder: (content, index) {
//         return new Container(height: 0.5, color: Colors.grey);
//       },
//       itemBuilder: (context, index) {
//         if (index == dataLoader.length) {
//           return LoadingIndicator(dataLoader: dataLoader);
//         } else {
//           return Material(
//             color: Colors.white,
//             child: new InkWell(
//               child: Padding(
//                 padding: EdgeInsets.all(32),
//                 child: Text(dataLoader[index].title!),
//               ),
//               onTap: () {},
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// /// 数据业务逻辑处理
// class _DataLoader extends DataLoadMoreBase<Article, Model> {
//   bool _hasMore = true;

//   int _id; // 请求时的参数

//   _DataLoader(this._id);

//   @override
//   Future<Model> getRequest(bool isRefresh, int currentPage, int pageSize) async {
//     // 这里模拟网络请求
//     // var list = List;
//     List list = [];
//     for (var i = 0; i < 10; i++) {
//       var article = Article(title: "Article$currentPage $_id $i");
//       list.add(article);
//     }
//     await Future.delayed(Duration(seconds: 2));

//     return Model(data: list, message: "加载成功", code: 0);
//   }

//   @override
//   Future<bool> handlerData(Model model, bool isRefresh) async {
//     // 1. 判断是否有业务错误,
//     // 2. 将数据存入列表, 如果是刷新清空数据
//     // 3. 判断是否有更多数据
//     if (model == null || model.isError()) {
//       return false;
//     }

//     if (isRefresh) clear();

//     // todo 实际使用时这里需要修改
//     addAll((model.data as List<dynamic>).map((d) {
//       return d as Article;
//     }));

//     _hasMore = length < 100;

//     return true;
//   }

//   @override
//   bool hasMore() => _hasMore;
// }
