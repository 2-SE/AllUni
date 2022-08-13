import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Utils/DrawerCalendarChooseButton.dart';
import 'package:navigation_drawer_test/Calendars/Calendar.dart';



class DrawerCalendarView extends StatefulWidget {

  String currentView = "";
  List<bool> isSelectedFormat = [];
  DrawerCalendarView({
    super.key,
    required this.currentView,
    required this.isSelectedFormat,
  });

  @override
  State<DrawerCalendarView> createState() => _DrawerCalendarViewState();
}

class _DrawerCalendarViewState extends State<DrawerCalendarView> {

  int currentFormat = 0;

  @override
  Widget build(BuildContext context) {
    var isSelectedFormat = widget.isSelectedFormat;
    //var currentFormat = widget.currentFormat;
    var currentView = widget.currentView;
    for (int index = 0; index < isSelectedFormat.length; index++) {
      if (isSelectedFormat[index] == true) {
        currentFormat = index;
      }
    }
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
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => Calendar("Mon Calendrier", currentFormat)))
                        .then((_) {
                      setState(() {
                      });
                    });
                    //Navigator.pushNamed(context, "/calendar");
                  },
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
                  title: Text("Calendriers Autres Promotions"),
                  trailing: Icon(Icons.people_outlined, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => Calendar("Autres Promotions", currentFormat)))
                        .then((_) {
                      setState(() {
                      });
                    });                    //Navigator.pushNamed(context, "/calendar");
                  },
                ),
                ListTile(
                  title: Text("Calendrier Salles Libres"),
                  trailing: Icon(Icons.meeting_room_outlined, color: Colors.black),
                  onTap: () {
                    //Navigator.of(context).pop();
                    //Navigator.pushNamed(context, "/freerooms");
                  },
                ),
                ListTile(
                  title: Text("Calendrier de l'École"),
                  trailing: Icon(Icons.school_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => Calendar("Calendrier École", currentFormat)))
                        .then((_) {
                      setState(() {
                      });
                    });                    //Navigator.pushNamed(context, "/calendar");
                  },
                ),
                Divider(color: Colors.black, height: 1),
                DrawerCalendarChooseButton(currentView: currentView, isSelected: isSelectedFormat), //LIGN OF ICONBUTTONS FOR CHOOSE THE TYPE OF THE CALENDAR
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
                        Navigator.pushNamed(context, "/settings");
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
                        Navigator.pushNamed(context, "/contact");
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