import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:  const CupertinoNavigationBar(
        middle: Text('リスト'),
      ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                              text: '絞り込み検索',
                              style: const TextStyle(fontSize: 14, color: CupertinoColors.link),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                debugPrint('search');
                              }
                          ),
                        )
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.65,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (builder, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: CupertinoColors.lightBackgroundGray),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text('item'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(top: 20.0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           SizedBox(
                //             width: 200,
                //             child: CupertinoTextField(
                //               textAlign: TextAlign.center,
                //               controller: titleController,
                //               style: const TextStyle(fontSize: 24,),
                //               decoration: const BoxDecoration(
                //                 border:  Border(bottom: BorderSide(color: Colors.grey))
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                //       child: SizedBox(
                //         height: MediaQuery.sizeOf(context).height * 0.6,
                //         child: ListView.builder(
                //           // shrinkWrap: true,
                //             itemCount: itemControllers.length,
                //             itemBuilder: (context, index) {
                //               return Dismissible(
                //                 key: Key(itemControllers[index].text),
                //                 direction: DismissDirection.startToEnd,
                //                 background: Container(
                //                   color: Colors.grey,
                //                   padding: const EdgeInsets.symmetric(horizontal: 8),
                //                   child: const Align(
                //                       alignment: Alignment.centerLeft,
                //                       child: Padding(
                //                         padding: EdgeInsets.all(8.0),
                //                         child: Icon(Icons.delete_outline_rounded, color: Colors.white, size: 32,),
                //                       )
                //                   ),
                //                 ),
                //                 onDismissed: (direction) {
                //                   item.completedDate = DateTime.now();
                //                   itemControllers.removeAt(index);
                //                 },
                //                 child: Container(
                //                   padding: const EdgeInsets.all(20),
                //                   decoration: const BoxDecoration(
                //                       border: Border(
                //                           bottom: BorderSide(width: 1, color: Colors.grey)
                //                       )
                //                   ),
                //                   child: Row(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     children: [
                //                       GestureDetector(
                //                         onTap: () {
                //                           setState(() {
                //                             clickedList.contains(index) ? clickedList.remove(index): clickedList.add(index);
                //                           });
                //                         },
                //                         child: Icon(
                //                           clickedList.contains(index) ? Icons.check_circle: Icons.circle_outlined,
                //                           size: 24,
                //                           // color: Colors.green,
                //                         ),
                //                       ),
                //                       const SizedBox(width: 30,),
                //                       SizedBox(
                //                         width: 200,
                //                         child: CupertinoTextField.borderless(
                //                           controller: itemControllers[index],
                //                         ),
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               );
                //             }),
                //       ),
                //     ),
                //
                //
                //   ],
                // ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    // backgroundColor: Colors.green,
                    onPressed: () {
                      debugPrint('tap');
                    },
                    child: const Icon(CupertinoIcons.add, color: Colors.white,),
                  ),
                )
              ]
            ),
          ),
        )
    );
  }
}
