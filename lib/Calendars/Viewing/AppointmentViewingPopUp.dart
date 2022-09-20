import 'package:AllUni/Calendars/EditingPages/EditingAppointmentPage.dart';
import 'package:AllUni/Calendars/Viewing/ConfirmAppointmentSuppressionPopUp.dart';
import 'package:AllUni/Calendars/Viewing/TagsNamesClips.dart';
import 'package:AllUni/Calendars/Viewing/ViewingPopUpDeadlineWidget.dart';
import 'package:AllUni/Calendars/Viewing/ViewingPopUpLessonsWidget.dart';
import 'package:AllUni/Calendars/Viewing/ViewingPopUpPlanningWidget.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Utils/Calendar/localLessonHandler.dart';
import 'package:AllUni/Utils/HeroDialogRequired.dart';
import 'package:flutter/material.dart';

class AppointmentViewingPopUp extends StatefulWidget {
  final CalendarAppointment calendarAppointment;

  const AppointmentViewingPopUp({
    Key? key,
    required this.calendarAppointment,
  }) : super(key: key);

  @override
  State<AppointmentViewingPopUp> createState() =>
      _AppointmentViewingPopUpState();
}

class _AppointmentViewingPopUpState extends State<AppointmentViewingPopUp> {
  // UTILS FUNCTIONS FOR VIEWING POPUP
  void DeleteAppointment() async {
    var navigatorOnDeleteResult = await Navigator.of(context).push(
      HeroDialogRequiredRoute(
        builder: (context) => const Center(
          child: ConfirmAppointmentSuppressionPopUp(),
        ),
      ),
    );
    if (navigatorOnDeleteResult == true) {
      LocalLessonHandler().deleteLocalLesson(
        LocalLessonHandler()
            .AppointmentToLocalLesson(widget.calendarAppointment),
      );
      Navigator.of(context).pop(true); // Refresh all page
    }
  }

  void OpenModifyAppointmentPage() async {
    var navigatorEditAppointmentResult = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditingAppointmentPage(
          calendarAppointment: widget.calendarAppointment,
        ),
      ),
    );
// TODO : Régler le problème avec le ré-Edit /!\
    if (navigatorEditAppointmentResult != null) {
      LocalLessonHandler().updateLocalLesson(
        LocalLessonHandler()
            .AppointmentToLocalLesson(widget.calendarAppointment),
        LocalLessonHandler()
            .AppointmentToLocalLesson(navigatorEditAppointmentResult),
      );
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.calendarAppointment);
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
                MediaQuery.of(context).size.width / 24,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (widget.calendarAppointment.tagsNames.isNotEmpty)
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: TagsNamesClips(
                                            calendarAppointment:
                                                widget.calendarAppointment,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          child: Wrap(
                                            alignment: WrapAlignment.end,
                                            spacing: -10,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.edit_note_rounded,
                                                  color: Color(
                                                      0xFF666666), //Color(0xFF4C75A0),
                                                ),
                                                onPressed: () =>
                                                    OpenModifyAppointmentPage(),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete_forever,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () =>
                                                    DeleteAppointment(),
                                              ),
                                            ],
                                          ),
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
                              ],
                            ),
                          )
                        : SizedBox(
                            // WITHOUT TAGS
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: (widget.calendarAppointment
                                            .appointmentType ==
                                        "Planning" ||
                                    widget.calendarAppointment
                                            .appointmentType ==
                                        "Deadline")
                                ? Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          widget.calendarAppointment.title,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Wrap(
                                            alignment: WrapAlignment.end,
                                            spacing: -10,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.edit_note_rounded,
                                                  color: Color(
                                                      0xFF666666), //Color(0xFF4C75A0),
                                                ),
                                                onPressed: () =>
                                                    OpenModifyAppointmentPage(),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete_forever,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () =>
                                                    DeleteAppointment(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                // = Lessons
                                : Text(
                                    widget.calendarAppointment.title,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                    ),
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
