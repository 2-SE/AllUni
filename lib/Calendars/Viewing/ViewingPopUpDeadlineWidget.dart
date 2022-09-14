import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Utils/DateHourUtils.dart';
import 'package:flutter/material.dart';

class ViewingPopUpDeadlineWidget extends StatefulWidget {
  final CalendarAppointment calendarAppointment;
  const ViewingPopUpDeadlineWidget({
    Key? key,
    required this.calendarAppointment,
  }) : super(key: key);

  @override
  State<ViewingPopUpDeadlineWidget> createState() =>
      _ViewingPopUpDeadlineWidgetState();
}

class _ViewingPopUpDeadlineWidgetState
    extends State<ViewingPopUpDeadlineWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Jusqu'au :   ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "${DateHourUtils.toDate(widget.calendarAppointment.deadlineDate)}\n${DateHourUtils.toTime(widget.calendarAppointment.deadlineDate)}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
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
                      : "Aucune note n'est enregistrée pour cette deadline.",
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
