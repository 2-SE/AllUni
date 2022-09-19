import 'package:AllUni/OtherViews/AllSettings/Settings.dart';
import 'package:AllUni/OtherViews/ProfileManagement/ProfileModifierPage.dart';
import 'package:flutter/material.dart';

class ChoosePersonalAcademicMajorPopUp extends StatefulWidget {
  String myPromotion = "";
  String myAcademicMajor = "";
  ChoosePersonalAcademicMajorPopUp({
    super.key,
    required this.myPromotion,
    required this.myAcademicMajor,
  });

  @override
  State<ChoosePersonalAcademicMajorPopUp> createState() =>
      _ChoosePersonalAcademicMajorPopUpState();
}

class _ChoosePersonalAcademicMajorPopUpState
    extends State<ChoosePersonalAcademicMajorPopUp> {
  @override
  Widget build(BuildContext context) {
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
                      "Choisissez votre Majeure",
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
                                if (index < AcademicMajorList.length) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          (widget.myAcademicMajor ==
                                                  AcademicMajorList[index])
                                              ? const Color(0xFF4C75A0)
                                              : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    child: Text(
                                      AcademicMajorList[index],
                                      style: TextStyle(
                                        color: (widget.myAcademicMajor ==
                                                AcademicMajorList[index])
                                            ? Colors.white
                                            : const Color(0xFF4C75A0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => SettingsPage(
                                          myPromotion: widget.myPromotion,
                                          myAcademicMajor:
                                              AcademicMajorList[index],
                                        ),
                                      ));
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileModifierPage(
                                          myPromotion: widget.myPromotion,
                                          myAcademicMajor:
                                              AcademicMajorList[index],
                                        ),
                                      ));
                                    },
                                  );
                                }
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
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
