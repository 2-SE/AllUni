import 'package:AllUni/OtherViews/AllSettings/Settings.dart';
import 'package:AllUni/OtherViews/ProfileManagement/ProfileModifierPage.dart';
import 'package:flutter/material.dart';

class ChoosePersonalPromotionPopUp extends StatefulWidget {
  String myPromotion = "";
  String myAcademicMajor = "";
  ChoosePersonalPromotionPopUp({
    super.key,
    required this.myPromotion,
    required this.myAcademicMajor,
  });

  @override
  State<ChoosePersonalPromotionPopUp> createState() =>
      _ChoosePersonalPromotionPopUpState();
}

class _ChoosePersonalPromotionPopUpState
    extends State<ChoosePersonalPromotionPopUp> {
  @override
  Widget build(BuildContext context) {
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
                      "Choisissez votre Promotion",
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
                                if (index <= 5) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: (widget.myPromotion ==
                                              (DateTime.now().year + index)
                                                  .toString())
                                          ? const Color(0xFF4C75A0)
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    child: Text(
                                      "${DateTime.now().year + index}",
                                      style: TextStyle(
                                        color: (widget.myPromotion ==
                                                (DateTime.now().year + index)
                                                    .toString())
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
                                          myPromotion:
                                              (DateTime.now().year + index)
                                                  .toString(),
                                          myAcademicMajor:
                                              widget.myAcademicMajor,
                                        ),
                                      ));
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileModifierPage(
                                          myPromotion:
                                              (DateTime.now().year + index)
                                                  .toString(),
                                          myAcademicMajor:
                                              widget.myAcademicMajor,
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
