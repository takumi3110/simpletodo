import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:simpletodo/model/category.dart';
import 'package:simpletodo/utils/widget_utils.dart';
import 'package:simpletodo/view/list/list_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController searchCategoryNameController = TextEditingController();

  List<Map<String, dynamic>> searchList = [];

  List<Category> categoryList = [
    Category(id: '1', name: '食料品'),
    Category(id: '2', name: '日用品')
  ];

  @override
  void initState() {
    super.initState();
    searchList.addAll([
      {
       'keyboardType': TextInputType.text,
       'controller': searchCategoryNameController,
       'label': 'カテゴリー名'
      }
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: WidgetUtils.createNavigationBar('カテゴリー'),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                              text: '絞り込み検索',
                              style: const TextStyle(fontSize: 14, color: CupertinoColors.link),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  WidgetUtils.showModal(context, searchList);
                                }),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 260,
                          child: CupertinoTextField(
                            controller: categoryController,
                            padding: const EdgeInsets.all(10),
                            placeholder: 'カテゴリーを追加',
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              if (categoryController.text.isNotEmpty) {
                                debugPrint(categoryController.text);
                              }
                            },
                            child: const Icon(
                              CupertinoIcons.add_circled_solid,
                              size: 40,
                              color: CupertinoColors.systemCyan,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.55,
                    child: ListView.builder(
                      itemCount: categoryList.length,
                      itemBuilder: (builder, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => ListPage(
                                            category: categoryList[index],
                                          )));
                            },
                            child: WidgetUtils.itemCard(Row(
                              children: [
                                Text('${index + 1}'),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(categoryList[index].name),
                              ],
                            ),)
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
