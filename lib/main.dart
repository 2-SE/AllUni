import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Drawers/CalendarDrawerView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Drawer Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        //primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.white : null,
      ),
      home: HomePage(),
    );
  }
}

class SelectedCalendar {
  final int SelectedCalendarType;
  const SelectedCalendar(this.SelectedCalendarType);
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Navigation Drawer Test'),
        //elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0:0.0,
      ),
      drawer: CalendarDrawerView(),
      //BODY PART
      body: Center(
          child: Text('Calendar Soon?'),
      ),

    );
  }
}

//Icon(Icons.meeting_room_outlined) or Icon(Icons.meeting_room_rounded)