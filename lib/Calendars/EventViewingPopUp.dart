import 'package:all_uni_dev/Pages/CalendarPages/DatabaseLoadPage.dart';
import 'package:all_uni_dev/Utils/Calendar/localLessonHandler.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:all_uni_dev/Calendars/EventEditingPage.dart';
import 'package:all_uni_dev/models/LocalLesson.dart';
import 'package:all_uni_dev/Utils/DateHourUtils.dart';


class EventViewingPopUp extends StatefulWidget {
  final LocalLesson lesson;

  const EventViewingPopUp({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  @override
  State<EventViewingPopUp> createState() => EventViewingPopUpState();
}

class EventViewingPopUpState extends State<EventViewingPopUp> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Hero(
          tag: widget.lesson.NomCours!,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 20,
                            width: 50,
                            color: Colors.green,
                            child: const Center(
                              child: Text(
                                "Cours",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit_note_rounded),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventEditingPage(lesson: widget.lesson)));
                                Navigator.of(context).pop;},
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                print(" widget lesson ${widget.lesson}");
                                LocalLessonHandler().deleteLocalLesson(widget.lesson);
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => DatabaseLoadPage(["1A"], 0, "Mon Calendrier")));},
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      widget.lesson.NomCours!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Date :   ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          DateHourUtils.toDate(DateTime.parse(widget.lesson.HeureDebut.toString())),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Horaires :   ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          DateHourUtils.toDateTime(DateTime.parse(widget.lesson.HeureDebut.toString())),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Salle :   ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          widget.lesson.Salle!,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Professeur :   ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          widget.lesson.Professeur!,
                          style: const TextStyle(
                            fontSize: 18,
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
