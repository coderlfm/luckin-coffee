import 'package:flutter/material.dart';
import 'initialize.dart';

import 'package:luckincoffee/extensions/int-extensions.dart';

class MainPage extends StatefulWidget {
  static const String routerName = '/';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: tabbar,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedFontSize: 10.px,
        unselectedFontSize: 10.px,
        unselectedLabelStyle: TextStyle(color: Colors.green),
        selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedItemColor: Colors.black38,
        showUnselectedLabels: true,
        selectedItemColor: Color(0xff2c4c7c),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
// class MainPage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('主页'),
//       ),
//       body: IndexedStack(
//         index: 0,
//         children: MainInitialize.pages,
//       ),
//       bottomNavigationBar: MainInitialize.bottomNavigationBar,
//     );
//   }
// }
