import 'package:flutter/material.dart';
import 'package:alluni/Calendars/Calendar.dart';
import 'package:alluni/Drawers/DrawerCalendarChooseButton.dart';

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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/DrawerBanner.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: 55,
                        width: 150,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            "assets/images/calligraphy/WhiteAllUniCalligraphy.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Spacer(),
                      const Text('NOM ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                      const Text('Prénom',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text("Mon Calendrier"),
                  trailing:
                      const Icon(Icons.today_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) =>
                                Calendar("Mon Calendrier", currentFormat)))
                        .then((_) {
                      setState(() {});
                    });
                  },
                ),
                const Divider(color: Colors.black, height: 1),
                Container(height: 15, color: Colors.transparent),
                Row(
                  children: const [
                    Text("    "),
                    Text("Autres Calendriers :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        )),
                  ],
                ),
                Container(height: 5, color: Colors.transparent),
                ListTile(
                  title: const Text("Calendriers Autres Promotions"),
                  trailing:
                      const Icon(Icons.people_outlined, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) =>
                                Calendar("Autres Promotions", currentFormat)))
                        .then((_) {
                      setState(() {});
                    }); //Navigator.pushNamed(context, "/calendar");
                  },
                ),
                ListTile(
                  title: const Text("Calendrier Salles Libres"),
                  trailing: const Icon(Icons.meeting_room_outlined,
                      color: Colors.black),
                  onTap: () {
                    //Navigator.of(context).pop();
                    //Navigator.pushNamed(context, "/freerooms");
                  },
                ),
                ListTile(
                  title: const Text("Calendrier de l'École"),
                  trailing:
                      const Icon(Icons.school_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) =>
                                Calendar("Calendrier École", currentFormat)))
                        .then((_) {
                      setState(() {});
                    }); //Navigator.pushNamed(context, "/calendar");
                  },
                ),
                const Divider(color: Colors.black, height: 1),
                DrawerCalendarChooseButton(
                    currentView: currentView,
                    isSelected:
                        isSelectedFormat), //LIGN OF ICONBUTTONS FOR CHOOSE THE TYPE OF THE CALENDAR
                const Divider(color: Colors.black, height: 1),
              ],
            ),
          ),

          //BOTTOM DRAWER ITEMS
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              children: [
                const Divider(color: Colors.black, height: 1),
                ListTile(
                  title: const Text("Paramètres"),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  trailing: const Icon(Icons.settings, color: Colors.black),
                  onTap: () {
                    Navigator.pushNamed(context, "/settings");
                  },
                ),
                ListTile(
                  title: const Text("Déconnexion",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  trailing: const Icon(Icons.logout_rounded, color: Colors.red),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Divider(color: Colors.black, height: 1),
                ListTile(
                  title: const Text("Nous Contacter",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.indigo,
                      )),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  trailing:
                      const Icon(Icons.outgoing_mail, color: Colors.indigo),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, "/contact");
                  },
                ),
                Container(height: 15, color: Colors.transparent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Icon(Icons.meeting_room_outlined) or Icon(Icons.meeting_room_rounded)
