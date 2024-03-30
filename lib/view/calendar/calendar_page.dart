import 'package:flutter/cupertino.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Center(child: const Text('calendar page')));
  }
}
