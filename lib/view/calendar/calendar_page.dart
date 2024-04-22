import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpletodo/model/item.dart';
import 'package:simpletodo/utils/calendar_utils.dart';
import 'package:simpletodo/utils/widget_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final ValueNotifier<List<Item>> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Item> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  final events = LinkedHashMap(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(({
    kToday: [
    //   TODO:ここに表示したいitemを追加
      Item(
        category: 'category',
        name: 'name',
        createdDate: DateTime.now(),
        updatedDate: DateTime.now()
      )
    ]
  }));

  @override
  void initState() {
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    super.initState();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: WidgetUtils.createNavigationBar('カレンダー'),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCalendar(
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: _focusedDay,
                    // calendarFormat: _calendarFormat,
                    // calendarStyle: const CalendarStyle(outsideDaysVisible: false),
                    // locale: 'ja_JP',
                    headerStyle: const HeaderStyle(formatButtonVisible: false),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    eventLoader: _getEventsForDay,
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (_, day) {
                        final text = DateFormat.E('ja').format(day);
                        if (day.weekday == DateTime.saturday) {
                          return Center(
                            child: Text(text, style: const TextStyle(color: CupertinoColors.systemBlue, fontSize: 13),),
                          );
                        } else if (day.weekday == DateTime.sunday) {
                          return Center(
                            child: Text(text, style: const TextStyle(color: CupertinoColors.systemRed, fontSize: 13),),
                          );
                        } else {
                          return Center(
                            child: Text(text, style: const TextStyle(fontSize: 13),),
                          );
                        }
                      },
                        headerTitleBuilder: (_, day) {
                          final DateFormat dateFormatForMonth = DateFormat('yyyy年M月');
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(dateFormatForMonth.format(_focusedDay), style: const TextStyle(fontSize: 16),),
                              CupertinoButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedDay = DateTime.now();
                                      _focusedDay = DateTime.now();
                                    });
                                  },
                                  child: const Text('今日')
                              ),
                            ],
                          );
                        }
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _selectedEvents.value.length,
                      itemBuilder: (builder, index) {
                        final event = _selectedEvents.value[index];
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                            child: WidgetUtils.itemCard(Text(event.name))
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
