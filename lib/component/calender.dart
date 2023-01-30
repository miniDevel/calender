import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../const/colors.dart';

class Calender extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDay;
  final DateTime focusedDay;

  const Calender(
      {required this.onDaySelected,
      required this.selectedDay,
      required this.focusedDay,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
        //테두리 둥글게 깎기
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey[200]);

    final defaultTextStyle =
        TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w700);

    return TableCalendar(
      // 한글로 바꿔주는 파라미터.
      locale: 'ko_KR',
      focusedDay: this.focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle:
              TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0)),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          //날짜 컨테이너의 데코레이션션
          defaultDecoration: BoxDecoration(
              //테두리 둥글게 깎기
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[200]),
          weekendDecoration: defaultBoxDeco,
          selectedDecoration: defaultBoxDeco,
          outsideDecoration: BoxDecoration(shape: BoxShape.rectangle),
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          selectedTextStyle: defaultTextStyle.copyWith(color: PrimaryColor)),
      onDaySelected: this.onDaySelected,
      selectedDayPredicate: (DateTime date) {
        if (this.selectedDay == null) {
          return false;
        }

        return date.year == this.selectedDay!.year &&
            date.month == this.selectedDay!.month &&
            date.day == this.selectedDay!.day;
      },
    );
  }
}
