import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Drawers/DrawerCalendarView.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class Calendar extends StatefulWidget {
  String currentView;
  int CalendarFormatIndex;

  Calendar(this.currentView, this.CalendarFormatIndex);

  @override
  State<Calendar> createState() {
    return _CalendarState(this.currentView, this.CalendarFormatIndex);
  }
}

class _CalendarState extends State<Calendar> {

  List<bool> CalendarFormat = [false, false, false, false];
  String CalendarFormatString = "";

  String currentView;
  int CalendarFormatIndex;
  _CalendarState(this.currentView, this.CalendarFormatIndex);

  final CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    CalendarFormat[widget.CalendarFormatIndex] = true;
    for (int index = 0; index < CalendarFormat.length; index++) {
      if (index == 0 && CalendarFormat[index] == true) {
        CalendarFormatString = "Planning";
        _controller.view = CalendarView.schedule;
      } else if (index == 1 && CalendarFormat[index] == true) {
        CalendarFormatString = "1 Jour";
        _controller.view = CalendarView.day;
      } else if (index == 2 && CalendarFormat[index] == true) {
        CalendarFormatString = "1 Semaine";
        _controller.view = CalendarView.week;
      } else if (index == 3 && CalendarFormat[index] == true) {
        CalendarFormatString = "1 Mois";
        _controller.view = CalendarView.month;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentView),
        backgroundColor: Color(0xFF4C75A0),
        foregroundColor: Colors.white,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: Icon(Icons.calendar_today),
                onTap: () {},
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: Icon(Icons.search),
                onTap: () {},
              )
          ),
        ],
        //elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0:0.0,
      ),
      drawer: DrawerCalendarView(
        currentView: widget.currentView,
        isSelectedFormat: CalendarFormat,
      ),
      body: SfCalendar(
        view: CalendarView.schedule,
        controller: _controller,
        todayHighlightColor: Color(0xFF4C75A0),
        todayTextStyle: TextStyle(color: Colors.white),
        firstDayOfWeek: 1,
        initialSelectedDate: DateTime.now(),
        monthViewSettings: MonthViewSettings(navigationDirection: MonthNavigationDirection.vertical),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF4C75A0),
        onPressed: () {
          //Navigator.of(context).push(
          //  MaterialPageRoute(builder: (context) => EventEditingPage()),
          //);
        },
      ),
    );
  }
}