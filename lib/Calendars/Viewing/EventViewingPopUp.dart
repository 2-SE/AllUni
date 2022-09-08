import 'package:AllUni/Calendars/Editing/EventEditingPage.dart';
import 'package:AllUni/Calendars/Viewing/TagsNamesClips.dart';
import 'package:AllUni/Calendars/Viewing/ViewingPopUpDeadlineWidget.dart';
import 'package:AllUni/Calendars/Viewing/ViewingPopUpLessonsWidget.dart';
import 'package:AllUni/Calendars/Viewing/ViewingPopUpPlanningWidget.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Providers/CalendarAppointmentsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventViewingPopUp extends StatefulWidget {
  final CalendarAppointment calendarAppointment;

  const EventViewingPopUp({
    Key? key,
    required this.calendarAppointment,
  }) : super(key: key);

  @override
  State<EventViewingPopUp> createState() => _EventViewingPopUpState();
}

class _EventViewingPopUpState extends State<EventViewingPopUp> {
  @override
  Widget build(BuildContext context) {
    //return Center(child: Text(widget.calendarAppointment.title));

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Hero(
          tag: widget.calendarAppointment.title,
          child: Material(
            color: (widget.calendarAppointment.appointmentType == "Planning")
                ? Colors.white
                : (widget.calendarAppointment.appointmentType == "Deadline")
                    ? const Color(0xFFF8E8E8) //0xFFE8BABA//0xFFE5B2B2
                    : const Color(0xFFDFE6EF), //0xFFDFE6EF//0xFFD5DFEA
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
                        (widget.calendarAppointment.tagsNames.isNotEmpty)
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: TagsNamesClips(
                                  calendarAppointment:
                                      widget.calendarAppointment,
                                ),
                              )
                            : Container(),
                        Wrap(
                          alignment: WrapAlignment.end,
                          spacing: -10,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit_note_rounded),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EventEditingPage(
                                        calendarAppointment:
                                            widget.calendarAppointment),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {
                                final provider =
                                    Provider.of<CalendarAppointmentsProvider>(
                                  context,
                                  listen: false,
                                );
                                //OPEN DELETE EVENT POPUP (NEED TO DO)
                                provider.deleteAppointment(
                                    widget.calendarAppointment);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      widget.calendarAppointment.title,
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
                    (widget.calendarAppointment.appointmentType == "Planning")
                        ? ViewingPopUpPlanningWidget(
                            calendarAppointment: widget.calendarAppointment,
                          )
                        : (widget.calendarAppointment.appointmentType ==
                                "Deadline")
                            ? ViewingPopUpDeadlineWidget(
                                calendarAppointment: widget.calendarAppointment,
                              )
                            : ViewingPopUpLessonsWidget(
                                calendarAppointment: widget.calendarAppointment,
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
