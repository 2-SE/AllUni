import 'package:navigation_drawer_test/Calendars/Calendar.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Pages/CalendarPages/DatabaseLoadPage.dart';

class OthersCalendarsPopUp extends StatefulWidget {
  int currentFormatView = 0;
  String myAcademicMajor = "";
  List<bool> isSelectedMajor = [];
  List<String> AcademicMajorList = [];
  OthersCalendarsPopUp({
    super.key,
    required this.myAcademicMajor,
    required this.isSelectedMajor,
    required this.AcademicMajorList,
    required this.currentFormatView,
  });

  @override
  State<OthersCalendarsPopUp> createState() => _OthersCalendarsPopUpState();
}

class _OthersCalendarsPopUpState extends State<OthersCalendarsPopUp> {
  @override
  Widget build(BuildContext context) {
    List<String> SelectedMajorName = [];
    String SelectedMajorString = "";
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Hero(
          tag: "",
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width / 24)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Choisissez la(les) classe(s) à visualiser",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "(maximum 3 en même temps)",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                    if (index < widget.AcademicMajorList.length) {
                                      return CheckboxListTile(
                                        title: Text(
                                          widget.AcademicMajorList[index],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        controlAffinity:
                                        ListTileControlAffinity.leading,
                                        value: widget.isSelectedMajor[index],
                                        onChanged: (value) {
                                          setState(() {
                                            widget.isSelectedMajor[index] =
                                                value ?? false;
                                          });
                                        },
                                        activeColor: const Color(0xFF4C75A0),
                                        checkColor: Colors.white,
                                      );
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                          onPressed: () {
                            for (int index = 0;
                            index < widget.AcademicMajorList.length;
                            index++) {
                              if (widget.isSelectedMajor[index] == true) {
                                SelectedMajorName.add(
                                    widget.AcademicMajorList[index]);
                              }
                            }
                            if (SelectedMajorName.length > 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "⚠   ATTENTION   ⚠\nVous ne pouvez pas sélectionner plus de 3 classes différentes.",
                                  ),
                                ),
                              );
                            } else {
                              if (SelectedMajorName.isEmpty) {
                                //CHECK PAS '2S' MAIS SI SelectedMajorName[0]==myAcademicMajor
                                Navigator.of(context)
                                    .push(MaterialPageRoute(
                                    builder: (context) => DatabaseLoadPage(SelectedMajorName, widget.currentFormatView, "Mon Calendrier"))) //AJOUTER LE FAIT DE DEVOIR CHARGER LES EDT DES PROMOS SELECTIONNÉES
                                    .then((_) {
                                  setState(() {});
                                });
                              } else {
                                for (int index = 0;
                                index < SelectedMajorName.length;
                                index++) {
                                  SelectedMajorString +=
                                  "${SelectedMajorName[index]} ";
                                  if (index + 1 < SelectedMajorName.length) {
                                    SelectedMajorString += "- ";
                                  }
                                }
                                if (SelectedMajorName.length == 1) {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                      builder: (context) => DatabaseLoadPage(SelectedMajorName, widget.currentFormatView, "Autres Promotions\nClasse: $SelectedMajorString"))) //AJOUTER LE FAIT DE DEVOIR CHARGER LES EDT DES PROMOS SELECTIONNÉES
                                      .then((_) {
                                    setState(() {});
                                  });
                                } else {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                      builder: (context) => DatabaseLoadPage(SelectedMajorName, widget.currentFormatView, "Autres Promotions\nClasses: $SelectedMajorString"))) //AJOUTER LE FAIT DE DEVOIR CHARGER LES EDT DES PROMOS SELECTIONNÉES
                                      .then((_) {
                                    setState(() {});
                                  });
                                }
                              }
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Voir le calendrier de cette(ces) classe(s)",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.indigo,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(
                                    Icons.save,
                                    color: Color(0xFF4C75A0),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0xFF4C75A0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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