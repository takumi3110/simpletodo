import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simpletodo/view/calendar/calendar_page.dart';
import 'package:simpletodo/view/category/category_page.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with WidgetsBindingObserver {
  int selectedIndex = 0;
  final _controller = CupertinoTabController();
  static List<Widget> pageList = [
    // const ListPage(),
    const CategoryPage(),
    const CalendarPage(),
    const Center(child: Text('まとめて追加')),
    const Center(child: Text('ゴミ箱')),
    const Center(child: Text('設定')),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 70,
        activeColor: Colors.blueAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.list_bullet), label: 'リスト'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar), label: 'カレンダー'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.plus_rectangle_fill_on_rectangle_fill), label: 'まとめて追加'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.trash_fill), label: 'ゴミ箱'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.gear_alt_fill), label: '設定'),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return pageList[index];
          },
        );
      },
      controller: _controller,
    );
    // return Scaffold(
    //   body: pageList[selectedIndex],
    //   bottomNavigationBar: CupertinoTabBar(
    //     items: [
    //             BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar), label: 'カレンダー'),
    //             BottomNavigationBarItem(icon: Icon(CupertinoIcons.list_bullet), label: 'リスト'),
    //     ],
    //     currentIndex: selectedIndex,
    //     onTap: (index) {
    //       setState(() {
    //         selectedIndex = index;
    //       });
    //     },
    //   ),
    //   // floatingActionButton: FloatingActionButton(
    //   //   onPressed: () {
    //   //
    //   //   },
    //   //   child: const Icon(CupertinoIcons.add),
    //   // ),
    // );
  }
}

