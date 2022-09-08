import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:flutter/material.dart';

class TagsNamesClips extends StatefulWidget {
  final CalendarAppointment calendarAppointment;

  const TagsNamesClips({
    Key? key,
    required this.calendarAppointment,
  }) : super(key: key);

  @override
  State<TagsNamesClips> createState() => _TagsNamesClipsState();
}

class _TagsNamesClipsState extends State<TagsNamesClips> {
  Color chooseColor(String element) {
    switch (element) {
      case 'Perso':
        return Colors.amber;
      case 'Travail':
        return const Color(0xFF6D071A);
      case 'Événement':
        return Colors.green;
      case 'Urgent':
        return Colors.red;
      default:
        return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tagsNames = widget.calendarAppointment.tagsNames;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: MediaQuery.of(context).size.width * 0.01,
        runSpacing: 3,
        runAlignment: WrapAlignment.start,
        children: [
          ...tagsNames
              .map((element) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 24,
                      color: chooseColor(element),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Center(
                          child: Text(
                            "  $element  ",
                            style: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
