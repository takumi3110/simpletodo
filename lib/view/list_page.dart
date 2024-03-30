import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simpletodo/model/todo.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> clickedList = [];

  final todo = Todo(
      title: 'title',
      item: [
        'item',
        'item2'
      ],
      createdDate: DateTime.now(),
      updatedDate: DateTime.now()
  );


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(todo.title),
      ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: todo.item.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Dismissible(
                        key: Key(todo.item[index]),
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
                                  clickedList.contains(index) ? Icons.circle_outlined: Icons.circle,
                                  size: 24,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 30,),
                              Text(todo.item[index]),
                            ],
                          ),
                        ),
                      ),
                      // const Divider()
                    ],
                  );
            }),
          ),
        )
    );
  }
}
