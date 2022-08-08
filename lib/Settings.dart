import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  //const NewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 240.0,
            stretch: true,
            backgroundColor: Color(0xFF4C75A0),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Paramètres', style: TextStyle(color: Colors.white)),
              background: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image(
                  image: AssetImage("images/logo_settings.png"),
                  //image: AssetImage("images/BannerLogoApp.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,/*BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/BannerLogoApp.png"),
                  fit: BoxFit.cover,*/
                ),
              ),
              stretchModes: [
                StretchMode.zoomBackground,
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              FlatButton(
                onPressed: () => {},
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.edit, color: Colors.indigo),
                    Text("Editer le Profil", style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic, color: Colors.indigo))
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
                  children: [
                    Text("NOM Prénom", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("prenom.nom@esme.fr", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              Container(height: 25, color: Colors.transparent),
              Divider(color: Colors.black, height: 1),
              Container(height: 10, color: Colors.transparent),
              ListTile(
                title: Text("Changer de Mot de Passe"),
                trailing: Icon(Icons.security),
                onTap: () {},
              ),
              ListTile(
                title: Text("Notifications"),
                trailing: Icon(Icons.notifications_active),
                onTap: () {},
              ),
              /*
              ListTile(
                title: Text("Langue"),
                trailing: Icon(Icons.language),
                onTap: () {},
              ),
              */
              Container(height: 10, color: Colors.transparent),
              Divider(color: Colors.black, height: 1),
              Container(height: 10, color: Colors.transparent),
              Row(
                children: [
                  Text("    "),
                  Text("Apparence :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black, decoration: TextDecoration.underline)),
                ],
              ),
              ListTile(
                title: Text("Thème"),
                trailing: Icon(Icons.dark_mode),
                onTap: () {},
              ),
              ListTile(
                title: Text("Visualisation Journée"),
                trailing: Icon(Icons.edit_calendar),
                onTap: () {},
              ),
              Container(height: 10, color: Colors.transparent),
              Divider(color: Colors.black, height: 1),
              Container(height: 10, color: Colors.transparent),
              ListTile(
                title: Text("Informations"),
                trailing: Icon(Icons.info_outline_rounded),
                onTap: () {},
              ),
              Container(height: 5, color: Colors.transparent),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: RaisedButton(
                  color: Colors.white,
                  textColor: Colors.red,
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.red, width: 1),
                  ),
                  onPressed: () {},
                  child: Text("     Déconnexion     ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
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