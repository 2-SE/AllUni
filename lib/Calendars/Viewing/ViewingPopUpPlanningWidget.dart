import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Utils/DateHourUtils.dart';
import 'package:flutter/material.dart';

class ViewingPopUpPlanningWidget extends StatefulWidget {
  final CalendarAppointment calendarAppointment;
  const ViewingPopUpPlanningWidget({
    Key? key,
    required this.calendarAppointment,
  }) : super(key: key);

  @override
  State<ViewingPopUpPlanningWidget> createState() =>
      _ViewingPopUpPlanningWidgetState();
}

class _ViewingPopUpPlanningWidgetState
    extends State<ViewingPopUpPlanningWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (DateHourUtils.toDate(widget.calendarAppointment.fromDate) ==
                DateHourUtils.toDate(widget.calendarAppointment.toDate))
            ? Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        DateHourUtils.toDate(
                            widget.calendarAppointment.fromDate),
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
                        "${DateHourUtils.toTime(widget.calendarAppointment.fromDate)} - ${DateHourUtils.toTime(widget.calendarAppointment.toDate)}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dates :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Du :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${DateHourUtils.toDate(widget.calendarAppointment.fromDate)}  -  ${DateHourUtils.toTime(widget.calendarAppointment.fromDate)}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Au :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${DateHourUtils.toDate(widget.calendarAppointment.toDate)}  -  ${DateHourUtils.toTime(widget.calendarAppointment.toDate)}",
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
          // crossAxisAlignment:
          //     (widget.calendarAppointment.localization != "")
          //         ? CrossAxisAlignment.start
          //         : CrossAxisAlignment.end,
          children: [
            const Text(
              "Lieu :   ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            // ClipRRect(
            //   child: Center(
            //     child: SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.7,
            //       child: Text(
            //         (
            //                 widget.calendarAppointment.localization != "")
            //             ? widget.calendarAppointment.localization
            //             : "Pas de lieu renseigné",
            //         maxLines: 3,
            //         overflow: TextOverflow.ellipsis,
            //         style: TextStyle(
            //           fontSize:
            //               (
            //                       widget.calendarAppointment.localization != "")
            //                   ? 18
            //                   : 15,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        ClipRRect(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  (widget.calendarAppointment.description != "")
                      ? widget.calendarAppointment.description
                      : "Aucune note n'est enregistrée pour cet événement.",
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize:
                        (widget.calendarAppointment.description!.isNotEmpty ||
                                widget.calendarAppointment.description != "")
                            ? 15
                            : 13,
                  ),
                ),
              ),
            ),
          ),
        ),
        //Description view in a scroll section ? (or in an adaptive height view)
      ],
    );
  }
}
