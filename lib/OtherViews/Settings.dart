import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 240.0,
            stretch: true,
            backgroundColor: const Color(0xFF4C75A0),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Paramètres',
                  style: TextStyle(color: Colors.white)),
              background: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset("assets/images/Settings.png"),
                /*
                Image(
                  image: AssetImage("assets/images/logo_settings.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                */
              ),
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 0),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Icon(Icons.edit, color: Colors.indigo),
                    Text("Editer le Profil",
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          color: Colors.indigo,
                        ))
                  ],
                ),
              ),
              /*
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.indigo,
              ),
              */
              Container(height: 15, color: Colors.transparent),
              Center(
                child: Column(
                  children: const [
                    Text("NOM Prénom",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("prenom.nom@esme.fr", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              Container(height: 25, color: Colors.transparent),
              const Divider(color: Colors.black, height: 1),
              Container(height: 10, color: Colors.transparent),
              ListTile(
                title: const Text("Changer de Mot de Passe"),
                trailing: const Icon(Icons.security),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Notifications"),
                trailing: const Icon(Icons.notifications_active),
                onTap: () {},
              ),
              /*
              ListTile(
                title: const Text("Langue"),
                trailing: const Icon(Icons.language),
                onTap: () {},
              ),
              */
              Container(height: 10, color: Colors.transparent),
              const Divider(color: Colors.black, height: 1),
              Container(height: 10, color: Colors.transparent),
              Row(
                children: const [
                  Text("    "),
                  Text("Apparence :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.underline)),
                ],
              ),
              ListTile(
                title: const Text("Thème"),
                trailing: const Icon(Icons.dark_mode),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Visualisation Journée"),
                trailing: const Icon(Icons.edit_calendar),
                onTap: () {},
              ),
              Container(height: 10, color: Colors.transparent),
              const Divider(color: Colors.black, height: 1),
              Container(height: 10, color: Colors.transparent),
              ListTile(
                title: const Text("Informations"),
                trailing: const Icon(Icons.info_outline_rounded),
                onTap: () {},
              ),
              Container(height: 5, color: Colors.transparent),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(color: Colors.red),
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.red, width: 1),
                      )),
                  onPressed: () {},
                  child: const Text("     Déconnexion     ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                ),
              ),
              Container(height: 20, color: Colors.transparent),
            ]),
          ),
        ],
      ),
    );
  }
}
