import 'package:alluni/Calendars/Calendar.dart';
import 'package:alluni/Drawers/DrawerCalendarView.dart';
import 'package:alluni/OtherViews/AllSettings/Settings.dart';
import 'package:alluni/OtherViews/ContactUs/ContactUs.dart';
import 'package:alluni/OtherViews/ContactUs/ContactUsLogOut.dart';
import 'package:alluni/OtherViews/SplashLoad.dart';
import 'package:alluni/Providers/EventProvider.dart';
import 'package:flutter/material.dart';
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
          "/settings": (BuildContext context) => const SettingsPage(),
          "/contactLogIn": (BuildContext context) => const ContactUsPage(),
          "/contactLogOut": (BuildContext context) =>
              const ContactUsLogOutPage(),
          "/drawer": (BuildContext context) =>
              DrawerCalendarView(isSelectedFormat: const [], currentView: ""),
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
