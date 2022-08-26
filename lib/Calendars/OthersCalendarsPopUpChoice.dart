import 'package:AllUni/Calendars/Calendar.dart';
import 'package:flutter/material.dart';

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
                        FlatButton(
                          onPressed: () {
                            for (int index = 0;
                                index < widget.AcademicMajorList.length;
                                index++) {
                              if (widget.isSelectedMajor[index] == true) {
                                SelectedMajorName.add(
                                    widget.AcademicMajorList[index]);
                              }
                            }
                            if (SelectedMajorName.isEmpty ||
                                (SelectedMajorName.length == 1 &&
                                    SelectedMajorName[0] == '2S')) {
                              //CHECK PAS '2S' MAIS SI SelectedMajorName[0]==myAcademicMajor
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) => Calendar(
                                          "Mon Calendrier",
                                          widget
                                              .currentFormatView))) //AJOUTER LE FAIT DE DEVOIR CHARGER LES EDT DES PROMOS SELECTIONNÉES
                                  .then((_) {
                                setState(() {});
                              });
                            } else {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) => Calendar(
                                          "Autres Classes",
                                          widget
                                              .currentFormatView))) //AJOUTER LE FAIT DE DEVOIR CHARGER LES EDT DES PROMOS SELECTIONNÉES
                                  .then((_) {
                                setState(() {});
                              });
                            }
                          },
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
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
                              const SizedBox(
                                width: 20,
                              ),
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
