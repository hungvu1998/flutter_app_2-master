import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/resources/home_page.dart';
import 'package:flutter_app/src/resources/home_page2.dart';
import 'package:rect_getter/rect_getter.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _currentTabIndex = 0;
  List<Widget>_childerns;
  var controller = new PageController(keepPage: true);
  final bottomBarModel =  <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        title: Container(),
        icon: Icon(Icons.favorite)
    ),
    BottomNavigationBarItem(
        title: Container(),
        icon: Icon(Icons.home)
    ),
    BottomNavigationBarItem(
        title: Container(),
        icon: Icon(Icons.person)
    ),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        body: _childerns[_currentTabIndex],
//      body: PageView(
//        controller: controller,
//        onPageChanged: (int index){
//          _onTap(index);
//        },
//        children: _childerns,
//      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Stack(
          children: <Widget>[
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onTap: _onTap,
              selectedIconTheme: IconThemeData(
                color: Colors.black,
                size: 26,
              ),
              currentIndex: _currentTabIndex,
              items: bottomBarModel,
            ),

          ],
        ),
      ),
    );
  }
  void _onTap(int index){
    setState(() {
    //  controller.jumpToPage(index);

      _currentTabIndex = index;
    });
  }


  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    WidgetsBinding.instance.addPostFrameCallback(affterLayout);
    _childerns = [
      HomePage(),
      HomePage2(),
      HomePage2()
    ];
    super.initState();
  }
  void affterLayout(_){
    _onTap(2);
  }

}
