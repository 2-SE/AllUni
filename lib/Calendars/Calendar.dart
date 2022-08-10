import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Drawers/DrawerCalendarView.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class Calendar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Calendrier'),
        backgroundColor: Color(0xFF4C75A0),
        //elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0:0.0,
      ),
      drawer: DrawerCalendarView(),
      //BODY PART
      body: SfCalendar(
        view: CalendarView.month,

        initialSelectedDate: DateTime.now(),
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