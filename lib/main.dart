import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

//DRAWER IMPORT (for routes) :
import 'package:all_uni_dev/Calendars/FreeRoomsCalendar.dart';
import 'package:all_uni_dev/Drawers/DrawerCalendarView.dart';
import 'package:all_uni_dev/OtherViews/ContactUs/ContactUs.dart';
import 'package:all_uni_dev/OtherViews/Settings.dart';

//IMPORT FILES
import 'package:all_uni_dev/OtherViews/SplashLoad.dart';
import 'package:all_uni_dev/models/Lesson.dart';
import 'package:all_uni_dev/models/ModelProvider.dart';

//PROVIDERS
import 'package:all_uni_dev/Providers/EditProvider.dart';
import 'package:all_uni_dev/Providers/TypeEventProvider.dart';
import 'package:all_uni_dev/Providers/PlanningTagsProvider.dart';
import 'package:all_uni_dev/Providers/DeadlineTagsProvider.dart';
import 'package:all_uni_dev/Providers/CustomTagProvider.dart';
import 'package:provider/provider.dart';

import 'Pages/SignPages/SignInPage.dart';

import 'amplifyconfiguration.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EditPlanningProvider()),
        ChangeNotifierProvider(create: (_) => EditDeadlineProvider()),
        ChangeNotifierProvider(create: (_) => TypeEventProvider()),
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
    return ChangeNotifierProvider(
      create: (BuildContext context) { },
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
class MyHomePage extends StatefulWidget {


  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;

  TextEditingController totoController = TextEditingController();

  late List<Lesson> lessons;
  late String totodesc;






  Future<void> _configureAmplify() async {
    final Auth = AmplifyAuthCognito();
    final DS = AmplifyDataStore(modelProvider: ModelProvider.instance);
    final API = AmplifyAPI(modelProvider: ModelProvider.instance);
    try {
      await Future.wait([Amplify.addPlugins([Auth, DS, API])]);
      if (!Amplify.isConfigured) {
        print("!alreadyconfig");
        await Amplify.configure(amplifyconfig);
      }
    } on Exception catch (e) {return print("config except ------------- $e") ;}
  print("config success");
  }


  @override
  void initState()  {
    super.initState();
    print("$_isLoading");
    _configureAmplify();
    setState(() {
      _isLoading = false; // important to set the state!
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text('main')),
        body: _isLoading ?
        Center(child: CircularProgressIndicator()) :
        SignInPage()
   );
  }
}