import 'package:calender/component/calender.dart';
import 'package:calender/component/schedule_bottom_sheet.dart';
import 'package:calender/component/schedule_card.dart';
import 'package:calender/component/today_banner.dart';
import 'package:calender/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: renderFloatingActionButton(),
        body: Column(
          children: [
            Calender(
              onDaySelected: onDaySelected,
              selectedDay: selectedDay,
              focusedDay: focusedDay,
            ),
            SizedBox(
              height: 8,
            ),
            TodayBanner(selectedDay: selectedDay, scheduleCount: 3),
            SizedBox(
              height: 8,
            ),
            _ScheduleList()
          ],
        ),
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            // 스크롤이 원래 화면의 반만 가능한데 제한을 풀어줄수 있는 파라미터
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return ScheduleBottomSheet();
            });
      },
      backgroundColor: PrimaryColor,
      child: Icon(Icons.add),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay == selectedDay;
      this.focusedDay == selectedDay;
    });
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
            // itemBuileder가 실행할때마다 한번씩 실행됨
            separatorBuilder: (context, index) {
              return SizedBox(height: 8);
            },
            // 몇개의 값을 넣을지 지정을 함
            itemCount: 10,
            itemBuilder: (context, index) {
              return ScheduleCard(
                  color: Colors.red,
                  content: 'content',
                  endTime: 8,
                  startTime: 9);
            }),
      ),
    );
  }
}
