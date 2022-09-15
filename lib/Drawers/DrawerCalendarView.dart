import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:all_uni_dev/Drawers/DrawerCalendarChooseButton.dart';
import 'package:all_uni_dev/Pages/CalendarPages/DatabaseLoadPage.dart';
import 'package:all_uni_dev/Utils/Calendar/OthersCalendarsPopUpChoice.dart';

import '../Utils/HeroDialog.dart';

class DrawerCalendarView extends StatefulWidget {
  String currentView ;
  List<bool> isSelectedFormat;
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
        setState(() {
          currentFormat = index;
        });
      }
    }

    final AcademicMajorList = [
      "1A",
      "1B",
      "1C",
      "1D",
      "1E",
      "1F",
      "1G",
      "1H",
      "2B",
      "2C",
      "2D",
      "2E",
      "2F",
      "2G",
      "2I",
      "2M",
      "2N",
      "2R",
      "2S",
      "2T",
      "2V",
      "3B",
      "3C",
      "3E",
      "3F",
      "3G",
      "3I",
      "3M",
      "3N",
      "3R",
      "3S",
      "3T",
      "3V"
    ];

    List<bool> isSelectedMajor = [];
    isSelectedMajor = List<bool>.filled(AcademicMajorList.length, false);
    //isSelectedMajor[3] = true;

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
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DatabaseLoadPage(["1A"], 0, currentView)));
                    });
                    },
                ),
                const Divider(color: Colors.black, height: 1),
                const SizedBox(height: 15),
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
                const SizedBox(height: 5),
                ListTile(
                  title: const Text("Calendriers Autres Promotions"),
                  trailing:
                  const Icon(Icons.people_outlined, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).push(
                      HeroDialogRoute(
                        builder: (context) => Center(
                          child: OthersCalendarsPopUp(
                            myAcademicMajor: '2S',
                            isSelectedMajor: isSelectedMajor,
                            AcademicMajorList: AcademicMajorList,
                            currentFormatView: currentFormat,
                          ),
                        ),
                      ),
                    );
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
                        color: Color(0xFF4C75A0),
                      )),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  trailing:
                  const Icon(Icons.outgoing_mail, color: Color(0xFF4C75A0)),
                  onTap: () {
                    Navigator.pushNamed(context, "/contactLogOut");
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
