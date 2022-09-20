import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Utils/DateHourUtils.dart';
import 'package:flutter/material.dart';

class ViewingPopUpLessonsWidget extends StatefulWidget {
  final CalendarAppointment calendarAppointment;
  const ViewingPopUpLessonsWidget({
    Key? key,
    required this.calendarAppointment,
  }) : super(key: key);

  @override
  State<ViewingPopUpLessonsWidget> createState() =>
      _ViewingPopUpLessonsWidgetState();
}

class _ViewingPopUpLessonsWidgetState extends State<ViewingPopUpLessonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (DateHourUtils.toDate(widget.calendarAppointment.fromDate
                    .add(const Duration(hours: 2))) ==
                DateHourUtils.toDate(widget.calendarAppointment.toDate
                    .add(const Duration(hours: 2))))
            ? Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Date :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        DateHourUtils.toDate(widget.calendarAppointment.fromDate
                            .add(const Duration(hours: 2))),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Horaires :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${DateHourUtils.toTime(widget.calendarAppointment.fromDate.add(const Duration(hours: 2)))}"
                        " - ${DateHourUtils.toTime(widget.calendarAppointment.toDate.add(const Duration(hours: 2)))}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  const Text(
                    "Dates :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Du :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${DateHourUtils.toDate(widget.calendarAppointment.fromDate.add(const Duration(hours: 2)))}  -  ${DateHourUtils.toTime(widget.calendarAppointment.fromDate.add(const Duration(hours: 2)))}",
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Jusqu'au :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${DateHourUtils.toDate(widget.calendarAppointment.toDate.add(const Duration(hours: 2)))}  -  ${DateHourUtils.toTime(widget.calendarAppointment.toDate.add(const Duration(hours: 2)))}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Lieu :   ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Wrap(
              runAlignment: WrapAlignment.start,
              runSpacing: 4,
              children: [
                Text(
                  (widget.calendarAppointment.localization != "")
                      ? "${widget.calendarAppointment.localization}"
                      : "Aucun renseigné",
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Professeur :   ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Wrap(
              runAlignment: WrapAlignment.start,
              runSpacing: 4,
              children: [
                Text(
                  (widget.calendarAppointment.professor != "")
                      ? "${widget.calendarAppointment.professor}"
                      : "Aucun renseigné",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize:
                        (widget.calendarAppointment.professor != "") ? 18 : 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
