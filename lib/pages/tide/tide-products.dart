import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:luckincoffee/model/tide-model.dart';

class TideProducts extends StatelessWidget {
  late final List<CommodityList> products;

  TideProducts(this.products);

  @override
  Widget build(BuildContext context) {
    // return Text('111');

    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,   //横轴单元格数量

      itemCount: 20,  //元素数量
        physics: ScrollPhysics(),
        shrinkWrap: true,
      itemBuilder: (context,index){

        final prod = products[index];

        return Column(
          children: [
            Image.network(prod.defaultPicUrl),
            Text(prod.name),
            Text(prod.name),
          ],
        );
      },
      staggeredTileBuilder: (index)=> StaggeredTile.fit(2),
      padding: EdgeInsets.all(8),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );

    // return StaggeredGridView.builder(
    //   physics: ScrollPhysics(),
    //   shrinkWrap: true,

    //   gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 1),
    //   ),
    //   itemCount: products.length,
    //   itemBuilder: (BuildContext context, int index) => Container(
    //       color: Colors.green,
    //       child: Center(
    //
    //         child: CircleAvatar(
    //           backgroundColor: Colors.white,
    //           child: Text('$index'),
    //         ),
    //       )),
    // );
  }
}
