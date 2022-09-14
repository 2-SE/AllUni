import 'package:AllUni/Calendars/Calendar.dart';
import 'package:AllUni/Drawers/DrawerCalendarView.dart';
import 'package:AllUni/OtherViews/AllSettings/Settings.dart';
import 'package:AllUni/OtherViews/ContactUs/ContactUs.dart';
import 'package:AllUni/OtherViews/ContactUs/ContactUsLogOut.dart';
import 'package:AllUni/OtherViews/SplashLoad.dart';
import 'package:AllUni/Providers/CalendarAppointmentsProvider.dart';
import 'package:AllUni/Providers/CustomTagProvider.dart';
import 'package:AllUni/Providers/DeadlineTagsProvider.dart';
import 'package:AllUni/Providers/EditProvider.dart';
import 'package:AllUni/Providers/PlanningTagsProvider.dart';
import 'package:AllUni/Providers/TypeAppointmentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalendarAppointmentsProvider()),
        ChangeNotifierProvider(create: (_) => EditPlanningProvider()),
        ChangeNotifierProvider(create: (_) => EditDeadlineProvider()),
        ChangeNotifierProvider(create: (_) => TypeAppointmentProvider()),
        ChangeNotifierProvider(create: (_) => PlanningTagsProvider()),
        ChangeNotifierProvider(create: (_) => DeadlineTagsProvider()),
        ChangeNotifierProvider(create: (_) => CustomTagProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AllUni',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF4C75A0),
        ),
      ),
      routes: <String, WidgetBuilder>{
        "/settings": (BuildContext context) => SettingsPage(
              myPromotion: '',
              myAcademicMajor: '',
            ),
        "/contactLogIn": (BuildContext context) => const ContactUsPage(),
        "/contactLogOut": (BuildContext context) => const ContactUsLogOutPage(),
        "/drawer": (BuildContext context) =>
            DrawerCalendarView(isSelectedFormat: const [], currentView: ""),
      },
      home: const Splash(),
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
