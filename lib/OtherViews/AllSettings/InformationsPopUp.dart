import 'package:flutter/material.dart';

class InformationsPopUp extends StatelessWidget {
  const InformationsPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Hero(
          tag: "Informations",
          child: Material(
            color: Color(0xFF333333),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width / 24,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ),
        ),
      ),
    );
  }
}
