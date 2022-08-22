import 'package:flutter/material.dart';
//DRAWER IMPORT (for routes) :
import 'package:alluni/Calendars/Calendar.dart';
import 'package:alluni/Calendars/FreeRoomsCalendar.dart';
import 'package:alluni/Drawers/DrawerCalendarView.dart';
import 'package:alluni/OtherViews/ContactUs/ContactUs.dart';
import 'package:alluni/OtherViews/Settings.dart';
//IMPORT FILES
import 'package:alluni/OtherViews/SplashLoad.dart';
import 'package:alluni/Providers/EventProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        title: 'AllUni',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF4C75A0),
          ),
        ),
        routes: <String, WidgetBuilder>{
          "/freerooms": (BuildContext context) => const FreeRoomsCalendar(),
          "/settings": (BuildContext context) => const SettingsPage(),
          "/contact": (BuildContext context) => const ContactUsPage(),
          "/drawer": (BuildContext context) =>
              DrawerCalendarView(isSelectedFormat: const [], currentView: ""),
          //"/contact": (BuildContext context) => ContactUsLogOutPage(), //ForTestsOnlyNow
        },
        home: const Splash(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //HOME-PAGE WHEN APP STARTS
      body: Calendar("Mon Calendrier", 0),
    );
  }
}
