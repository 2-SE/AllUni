import 'package:AllUni/Calendars/EditingPages/EditingTextField.dart';
import 'package:AllUni/Calendars/EditingPages/TagChoicePlanningWidget.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Utils/DateHourUtils.dart';
import 'package:flutter/material.dart';

class EditingPlanningWidget extends StatefulWidget {
  final CalendarAppointment calendarEditAppointment;
  const EditingPlanningWidget({
    Key? key,
    required this.calendarEditAppointment,
  }) : super(key: key);

  @override
  State<EditingPlanningWidget> createState() => _EditingPlanningWidgetState();
}

class _EditingPlanningWidgetState extends State<EditingPlanningWidget> {
  final _formKey = GlobalKey<FormState>();
  late DateTime fromDate;
  late DateTime toDate;
  late bool isReEditFromDate = false;
  late bool isReEditToDate = false;

  @override
  void initState() {
    super.initState();
    final calendarEditAppointment = widget.calendarEditAppointment;
    fromDate = calendarEditAppointment.fromDate;
    toDate = calendarEditAppointment.toDate;
  }

  Widget buildDropDownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.keyboard_arrow_down_rounded),
        onTap: onClicked,
        dense: true,
        visualDensity: const VisualDensity(vertical: -2),
      );

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required String whichDate,
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2000, 1),
        lastDate: DateTime(2101),
      );
      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      if (whichDate == "from") {
        widget.calendarEditAppointment.fromDate = date.add(time);
        isReEditFromDate = true;
      } else if (whichDate == "to") {
        widget.calendarEditAppointment.toDate = date.add(time);
        isReEditToDate = true;
      }
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      if (whichDate == "from") {
        widget.calendarEditAppointment.fromDate = date.add(time);
        isReEditFromDate = true;
      } else if (whichDate == "to") {
        widget.calendarEditAppointment.toDate = date.add(time);
        isReEditToDate = true;
      }
      return date.add(time);
    }
  }

  Future pickFromDateTime({required bool pickDate}) async {
    final date =
        await pickDateTime(fromDate, whichDate: "from", pickDate: pickDate);
    if (date == null) return;
    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
      widget.calendarEditAppointment.toDate = toDate;
      isReEditToDate = true;
    }
    setState(() {
      fromDate = date;
    });
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        whichDate: "to",
        pickDate: pickDate,
        firstDate: pickDate ? fromDate : null);
    if (date == null) return;
    setState(() {
      toDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Du :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: buildDropDownField(
                          // text: (isReEditFromDate == false)
                          //     ? DateHourUtils.toDate(
                          //     widget.calendarEditAppointment.fromDate)
                          //     : DateHourUtils.toDate(fromDate),
                          text: DateHourUtils.toDate(
                              widget.calendarEditAppointment.fromDate),
                          onClicked: () async {
                            widget.calendarEditAppointment.fromDate =
                                await pickFromDateTime(pickDate: true);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildDropDownField(
                          // text: (isReEditFromDate == false)
                          //     ? DateHourUtils.toTime(
                          //         widget.calendarEditAppointment.fromDate)
                          //     : DateHourUtils.toTime(fromDate),
                          text: DateHourUtils.toTime(
                              widget.calendarEditAppointment.fromDate),
                          onClicked: () async {
                            widget.calendarEditAppointment.fromDate =
                                await pickFromDateTime(pickDate: false);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Au :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: buildDropDownField(
                          // text: (isReEditToDate == false)
                          //     ? DateHourUtils.toDate(
                          //         widget.calendarEditAppointment.toDate)
                          //     : DateHourUtils.toDate(toDate),
                          text: DateHourUtils.toDate(
                              widget.calendarEditAppointment.toDate),
                          onClicked: () async {
                            widget.calendarEditAppointment.toDate =
                                await pickToDateTime(pickDate: true);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildDropDownField(
                          // text: (isReEditToDate == false)
                          //     ? DateHourUtils.toTime(
                          //         widget.calendarEditAppointment.toDate)
                          //     : DateHourUtils.toTime(toDate),
                          text: DateHourUtils.toTime(
                              widget.calendarEditAppointment.toDate),
                          onClicked: () async {
                            widget.calendarEditAppointment.toDate =
                                await pickToDateTime(pickDate: false);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          EditingTextField(
            labelText: "Localisation",
            data: widget.calendarEditAppointment.localization ?? "",
            onUpdate: (value) {
              widget.calendarEditAppointment.localization = value;
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          TagsChoicePlanningWidget(
            calendarAppointment: widget.calendarEditAppointment,
          ),
        ],
      ),
    );
  }
}
