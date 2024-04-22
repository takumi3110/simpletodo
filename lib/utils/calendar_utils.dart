import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';


int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 12, 1);
final kLastDay = DateTime(kToday.year, kToday.month + 1, 0);