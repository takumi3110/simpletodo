import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetUtils {

  static Column FloatingAction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 70),
          child: FloatingActionButton(
            onPressed: () {
              // Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ))
            },
            child: Icon(CupertinoIcons.plus),
            backgroundColor: Colors.green,
          ),
        )
      ],
      );
}

}