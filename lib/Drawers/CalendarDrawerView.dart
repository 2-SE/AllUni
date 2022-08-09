import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Drawers/DrawerCalendarChooseButton.dart';
import 'package:navigation_drawer_test/OtherViews/ContactUs/ContactUs.dart';
import 'package:navigation_drawer_test/OtherViews/ContactUs/ContactUsLogOut.dart';
import 'package:navigation_drawer_test/OtherViews/Settings.dart';


class CalendarDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalendarDrawerView(),
      routes: <String, WidgetBuilder>{
        "/settings": (BuildContext context) => SettingsPage(),
        "/contact": (BuildContext context) => ContactUsPage(),
        //"/contact": (BuildContext context) => ContactUsLogOutPage(), //ForTestsOnly
      },
    );
  }
}

class SelectedCalendar {
  final int SelectedCalendarType;
  const SelectedCalendar(this.SelectedCalendarType);
}

class CalendarDrawerView extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  //const SelectedCalendar({super.key, required this.SelectedCalendarType});
  List<bool> isSelected = [false, false, false, false, false];
  //isSelected[SelectedCalendarType] = true;
  //print(isSelected);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          //TOP DRAWER ITEMS
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/BannerLogoApp.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text('AllUni', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white)),
                      Spacer(),
                      Spacer(),
                      Text('NOM ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                      Text('Prénom', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ],
                  ),
                ),
                ListTile(
                  title: Text("Mon Calendrier"),
                  trailing: Icon(Icons.today_rounded, color: Colors.black),
                  onTap: () {},
                ),
                Divider(color: Colors.black, height: 1),
                Container(height: 15, color: Colors.transparent),
                Row(
                  children: [
                    Text("    "),
                    Text("Autres Calendriers :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black, decoration: TextDecoration.underline)),
                  ],
                ),
                Container(height: 5, color: Colors.transparent),
                ListTile(
                  title: Text("Autres Promotions"),
                  trailing: Icon(Icons.people_outlined, color: Colors.black),
                  onTap: () {
                    //...
                  },
                ),
                ListTile(
                  title: Text("Calendrier Salles Libres"),
                  trailing: Icon(Icons.meeting_room_outlined, color: Colors.black),
                  onTap: () {
                    //...
                  },
                ),
                ListTile(
                  title: Text("Calendriers École"),
                  trailing: Icon(Icons.school_rounded, color: Colors.black),
                  onTap: () {
                    //...
                  },
                ),
                Divider(color: Colors.black, height: 1),
                DrawerCalendarChooseButton(), //LIGN OF ICONBUTTONS FOR CHOOSE THE TYPE OF THE CALENDAR
                Divider(color: Colors.black, height: 1),
              ],
            ),
          ),

          //BOTTOM DRAWER ITEMS
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                child: Column(
                  children: [
                    Divider(color: Colors.black, height: 1),
                    ListTile(
                      title: Text("Paramètres"),
                      dense: true,
                      visualDensity: VisualDensity(vertical: -2),
                      trailing: Icon(Icons.settings, color: Colors.black),
                      onTap: () {
                        Navigator.of(context).pushNamed("/settings");
                      },
                    ),
                    ListTile(
                      title: Text("Déconnexion", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                      dense: true,
                      visualDensity: VisualDensity(vertical: -2),
                      trailing: Icon(Icons.logout_rounded, color: Colors.red),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Divider(color: Colors.black, height: 1),
                    ListTile(
                      title: Text("Nous Contacter", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.indigo)),
                      dense: true,
                      visualDensity: VisualDensity(vertical: -2),
                      trailing: Icon(Icons.outgoing_mail, color: Colors.indigo),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed("/contact");
                      },
                    ),
                    Container(height: 15, color: Colors.transparent),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Icon(Icons.meeting_room_outlined) or Icon(Icons.meeting_room_rounded)