import 'package:AllUni/OtherViews/ProfileManagement/ChoosePersonalAcademicMajorPopUp.dart';
import 'package:AllUni/OtherViews/ProfileManagement/ChoosePersonalPromotionPopUp.dart';
import 'package:AllUni/Utils/HeroDialog.dart';
import 'package:flutter/material.dart';

class ProfileModifierPage extends StatefulWidget {
  String myPromotion = "";
  String myAcademicMajor = "";
  ProfileModifierPage({
    super.key,
    required this.myPromotion,
    required this.myAcademicMajor,
  });

  @override
  State<ProfileModifierPage> createState() => _ProfileModifierPageState();
}

class _ProfileModifierPageState extends State<ProfileModifierPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/logos/LogoOpacity10.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Éditer son Profil"),
          backgroundColor: const Color(0xFF4C75A0),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      height: (MediaQuery.of(context).size.height - 320) / 2,
                    ),
                    /*
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.indigo,
                    ),
                    */
                    Center(
                      child: Column(
                        children: const [
                          Text("NOM Prénom",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("prenom.nom@esme.fr",
                              style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(color: Colors.black, height: 1),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 5,
                          child: ListTile(
                            title: const Text("Promotion"),
                            trailing:
                                const Icon(Icons.keyboard_arrow_right_rounded),
                            tileColor: Colors.white38,
                            onTap: () {
                              Navigator.of(context).push(
                                HeroDialogRoute(
                                  builder: (context) => Center(
                                    child: ChoosePersonalPromotionPopUp(
                                      myPromotion: widget.myPromotion,
                                      myAcademicMajor: widget.myAcademicMajor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Flexible(
                          child: Text(
                            widget.myPromotion,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 5,
                          child: ListTile(
                            title: const Text("Majeure / Classe"),
                            trailing:
                                const Icon(Icons.keyboard_arrow_right_rounded),
                            tileColor: Colors.white38,
                            onTap: () {
                              Navigator.of(context).push(
                                HeroDialogRoute(
                                  builder: (context) => Center(
                                    child: ChoosePersonalAcademicMajorPopUp(
                                      myPromotion: widget.myPromotion,
                                      myAcademicMajor: widget.myAcademicMajor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Flexible(
                          child: Text(
                            widget.myAcademicMajor,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.black, height: 1),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
