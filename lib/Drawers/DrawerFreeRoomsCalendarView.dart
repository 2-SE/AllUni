import 'package:flutter/material.dart';

class DrawerFreeRoomsView extends StatelessWidget {
  const DrawerFreeRoomsView({Key? key}) : super(key: key);

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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/DrawerBanner.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Spacer(),
                      Text('AllUni',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.white)),
                      Spacer(),
                      Spacer(),
                      Text('NOM ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                      Text('Prénom',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text("Mon Calendrier"),
                  trailing:
                      const Icon(Icons.today_rounded, color: Colors.black),
                  onTap: () {
                    //Navigator.of(context).pop();
                    //Navigator.pushNamed(context, "/calendar");
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
                            decoration: TextDecoration.underline)),
                  ],
                ),
                Container(height: 5, color: Colors.transparent),
                ListTile(
                  title: const Text("Autres Promotions"),
                  trailing:
                      const Icon(Icons.people_outlined, color: Colors.black),
                  onTap: () {
                    //...
                  },
                ),
                ListTile(
                  title: const Text("Calendrier Salles Libres"),
                  trailing: const Icon(Icons.meeting_room_outlined,
                      color: Colors.black),
                  onTap: () {
                    //Navigator.of(context).pop();
                    Navigator.pushNamed(context, "/freerooms");
                  },
                ),
                ListTile(
                  title: const Text("Calendriers École"),
                  trailing:
                      const Icon(Icons.school_rounded, color: Colors.black),
                  onTap: () {
                    //...
                  },
                ),
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
                          fontStyle: FontStyle.italic, color: Colors.indigo)),
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
