import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
//DRAWER IMPORT (for routes) :
import 'package:navigation_drawer_test/Calendars/Calendar.dart';
import 'package:navigation_drawer_test/Calendars/FreeRoomsCalendar.dart';
import 'package:navigation_drawer_test/Drawers/DrawerCalendarView.dart';
import 'package:navigation_drawer_test/OtherViews/ContactUs/ContactUs.dart';
import 'package:navigation_drawer_test/OtherViews/Settings.dart';
//IMPORT FILES
import 'package:navigation_drawer_test/OtherViews/SplashLoad.dart';
import 'package:navigation_drawer_test/Providers/EventProvider.dart';
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
