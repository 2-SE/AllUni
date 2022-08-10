import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Calendars/Calendar.dart';

//DRAWER IMPORT (for routes) :
import 'package:navigation_drawer_test/Calendars/Calendar.dart';
import 'package:navigation_drawer_test/Calendars/FreeRoomsCalendar.dart';
import 'package:navigation_drawer_test/OtherViews/ContactUs/ContactUs.dart';
import 'package:navigation_drawer_test/OtherViews/ContactUs/ContactUsLogOut.dart';
import 'package:navigation_drawer_test/OtherViews/Settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AllUni',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        //primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.white : null,
      ),
      routes: <String, WidgetBuilder>{
        "/calendar": (BuildContext context) => Calendar(),
        "/freerooms": (BuildContext context) => FreeRoomsCalendar(),
        "/settings": (BuildContext context) => SettingsPage(),
        "/contact": (BuildContext context) => ContactUsPage(),
        //"/contact": (BuildContext context) => ContactUsLogOutPage(), //ForTestsOnly
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //HOME-PAGE WHEN APP STARTS
      body: Calendar(),
    );
  }
}