import 'package:AllUni/OtherViews/AllSettings/InformationsPopUp.dart';
import 'package:AllUni/OtherViews/ProfileManagement/ProfileModifierPage.dart';
import 'package:AllUni/Utils/HeroDialog.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  String myPromotion = "";
  String myAcademicMajor = "";
  SettingsPage({
    super.key,
    required this.myPromotion,
    required this.myAcademicMajor,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              ),
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              FlatButton(
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileModifierPage(
                      myPromotion: widget.myPromotion,
                      myAcademicMajor: widget.myAcademicMajor,
                    ),
                  ))
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
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
              const SizedBox(height: 15),
              Center(
                child: Column(
                  children: [
                    const Text(
                      "NOM Prénom",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "prenom.nom@esme.fr",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Promotion :  ${widget.myPromotion}",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Majeure :  ${widget.myAcademicMajor}",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Divider(color: Colors.black, height: 1),
              const SizedBox(height: 10),
              /*
              ListTile(
                title: const Text("Changer de Mot de Passe"),
                trailing: const Icon(Icons.security),
                onTap: () {},
              ),
               */
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
              const SizedBox(height: 10),
              const Divider(color: Colors.black, height: 1),
              const SizedBox(height: 15),
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
              /*
              ListTile(
                title: const Text("Visualisation Journée"),
                trailing: const Icon(Icons.edit_calendar),
                onTap: () {},
              ),
              */
              const SizedBox(height: 10),
              const Divider(color: Colors.black, height: 1),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Informations"),
                trailing: const Icon(Icons.info_outline_rounded),
                onTap: () {
                  Navigator.of(context).push(
                    HeroDialogRoute(
                      builder: (context) => Center(
                        child: InformationsPopUp(),
                      ),
                    ),
                  );

                  /*
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Hero(
                        tag: "Informations",
                        child: Material(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width / 24,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(
                                            "assets/images/calligraphy/WhiteAllUniCalligraphy.png",
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    "But de l'application :",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const Text(
                                    "En quelques mots, améliorer l'expérience utilisateur sur les applications quotidiennes "
                                    "utilisées par les étudiants d'écoles supérieures.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Sécurité :",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const Text(
                                    "- Toutes informations personnelles requises par l'application servent uniquement à la bonne gestion de votre utilisation de l'application et sont stockées intégralement sur des serveurs français (Paris).\n"
                                    "- Vos identifiants et mots de passe ne nous sont pas accessibles, ils sont cryptés conformément à la loi française et au RGPD (Règlement Général sur la Protection des Données).\n"
                                    "- Aucune donnée vous concernant ne sera utilisée à des fins commerciales.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "© COPYRIGHT 2022 - Tous droits réservés\nAllUni",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                  */
                  /*
                  SizedBox(
                        //height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(
                                          "assets/images/calligraphy/WhiteAllUniCalligraphy.png",
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "But de l'application :",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const Text(
                                  "En quelques mots, améliorer l'expérience utilisateur sur les applications quotidiennes "
                                  "utilisées par les étudiants d'écoles supérieures.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Sécurité :",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const Text(
                                  "- Toutes informations personnelles requises par l'application servent uniquement à la bonne gestion de votre utilisation de l'application et sont stockées intégralement sur des serveurs français (Paris).\n"
                                  "- Vos identifiants et mots de passe ne nous sont pas accessibles, ils sont cryptés conformément à la loi française et au RGPD (Règlement Général sur la Protection des Données).\n"
                                  "- Aucune donnée vous concernant ne sera utilisée à des fins commerciales.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "© COPYRIGHT 2022 - Tous droits réservés\nAllUni",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      );
                  */

                  /*
                  showModalBottomSheet(
                    backgroundColor: const Color(0xFF333333),
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        //height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(
                                          "assets/images/calligraphy/WhiteAllUniCalligraphy.png",
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "But de l'application :",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const Text(
                                  "En quelques mots, améliorer l'expérience utilisateur sur les applications quotidiennes "
                                  "utilisées par les étudiants d'écoles supérieures.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Sécurité :",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const Text(
                                  "- Toutes informations personnelles requises par l'application servent uniquement à la bonne gestion de votre utilisation de l'application et sont stockées intégralement sur des serveurs français (Paris).\n"
                                  "- Vos identifiants et mots de passe ne nous sont pas accessibles, ils sont cryptés conformément à la loi française et au RGPD (Règlement Général sur la Protection des Données).\n"
                                  "- Aucune donnée vous concernant ne sera utilisée à des fins commerciales.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "© COPYRIGHT 2022 - Tous droits réservés\nAllUni",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                   */
                },
              ),
              const SizedBox(height: 15),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: RaisedButton(
                  color: Colors.white,
                  textColor: Colors.red,
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.red, width: 1),
                  ),
                  onPressed: () {},
                  child: const Text("     Déconnexion     ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                ),
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ],
      ),
    );
  }
}
