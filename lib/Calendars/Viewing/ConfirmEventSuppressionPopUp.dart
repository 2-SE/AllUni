import 'package:flutter/material.dart';

class ConfirmEventSuppressionPopUp extends StatelessWidget {
  const ConfirmEventSuppressionPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Hero(
          tag: "",
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width / 28)),
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
                    "Êtes vous sûr de vouloir supprimer cet élément de votre calendrier ?",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      color: Color(0xFFA90404),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Attention, cette action est irreversible",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black, //Color(0xFFA90404),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.black, //Color(0xFFA90404),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            null,
                          );
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.resolveWith(
                            (states) =>
                                const Color(0xFF4C75A0).withOpacity(0.1),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Non, annuler l'action",
                          style: TextStyle(
                            color: Color(0xFF4C75A0),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            true,
                          );
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.resolveWith(
                            (states) =>
                                const Color(0xFFA90404).withOpacity(0.1),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Oui, supprimer",
                          style: TextStyle(
                            color: Colors.red,
                          ),
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
    );
  }
}
