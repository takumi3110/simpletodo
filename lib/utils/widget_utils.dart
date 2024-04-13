
import 'package:flutter/cupertino.dart';

class WidgetUtils {

  static showModal(BuildContext context, List<Map<String, dynamic>> itemList) {
    return  showCupertinoModalPopup(
      // barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => CupertinoPopupSurface(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.55,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: CupertinoColors.systemBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CupertinoTextFormFieldRow(
                          keyboardType: itemList[index]['keyboardType'],
                          controller: itemList[index]['controller'],
                          prefix: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SizedBox(width: 80, child: Text(itemList[index]['label'], style: const TextStyle(fontSize: 14, ),)),
                          ),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: CupertinoColors.opaqueSeparator))),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                ),
                CupertinoButton(
                    child: const Text('SAVE', style: TextStyle(fontSize: 20, ),),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ));
  }
}