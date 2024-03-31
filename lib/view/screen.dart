import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simpletodo/utils/widget_utils.dart';
import 'package:simpletodo/view/calendar/calendar_page.dart';
import 'package:simpletodo/view/list_page.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with WidgetsBindingObserver {
  int selectedIndex = 0;
  final _controller = CupertinoTabController();
  static List<Widget> pageList = [
    const CalendarPage(),
    const ListPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar), label: 'カレンダー'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.list_bullet), label: 'リスト'),
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

