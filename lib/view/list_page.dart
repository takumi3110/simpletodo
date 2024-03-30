import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:simpletodo/model/todo.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> clickedList = [];

  TextEditingController titleController = TextEditingController(text: 'ttt');
  List<TextEditingController> itemControllers = [];

  final todo = Todo(
      title: 'title',
      items: [
        'item',
        'item2'
      ],
      createdDate: DateTime.now(),
      updatedDate: DateTime.now()
  );

  @override
  void initState() {
    super.initState();
    for (var item in todo.items) {
      itemControllers.add(TextEditingController(text: item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: GestureDetector(
          onTap: ()  {
            debugPrint('tap title');
          },
            child: Text(todo.title)
        ),
      ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemControllers.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(itemControllers[index].text),
                        direction: DismissDirection.startToEnd,
                        background: Container(
                          color: Colors.grey,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.delete_outline_rounded, color: Colors.white, size: 32,),
                              )
                          ),
                        ),
                        onDismissed: (direction) {
                          todo.completedDate = DateTime.now();
                          itemControllers.removeAt(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(width: 1, color: Colors.grey)
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    clickedList.contains(index) ? clickedList.remove(index): clickedList.add(index);
                                  });
                                },
                                child: Icon(
                                  clickedList.contains(index) ? Icons.check_circle: Icons.circle_outlined,
                                  size: 24,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 30,),
                              SizedBox(
                                width: 200,
                                child: CupertinoTextField.borderless(
                                  controller: itemControllers[index],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: () {
                      //   TODO: 押したら編集モード
                      debugPrint('tap');
                      setState(() {
                        itemControllers.add(TextEditingController());
                      });
                    },
                    child: const Icon(CupertinoIcons.add, color: Colors.white,),
                  ),
                ),
              )
            ]
          ),
        )
    );
  }
}
