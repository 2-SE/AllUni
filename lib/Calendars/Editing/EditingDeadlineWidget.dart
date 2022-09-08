import 'package:AllUni/Calendars/Editing/TagChoiceDeadlineWidget.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Providers/EditProvider.dart';
import 'package:AllUni/Utils/DateHourUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditingDeadlineWidget extends StatefulWidget {
  final CalendarAppointment? calendarAppointment;
  const EditingDeadlineWidget({
    Key? key,
    this.calendarAppointment,
  }) : super(key: key);

  @override
  State<EditingDeadlineWidget> createState() => _EditingDeadlineWidgetState();
}

class _EditingDeadlineWidgetState extends State<EditingDeadlineWidget> {
  final _formKey = GlobalKey<FormState>();
  late DateTime deadlineDate;
  late List<String> tagsNames;
  String myCustomTagName = "";

  @override
  void initState() {
    super.initState();
    if (widget.calendarAppointment == null) {
      deadlineDate = DateTime.now().add(const Duration(hours: 1));
      tagsNames = [];
    } else {
      final deadline = widget.calendarAppointment!;
      deadlineDate = deadline.deadlineDate;
      tagsNames = deadline.tagsNames;
    }
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
      Provider.of<EditDeadlineProvider>(context, listen: false)
          .changeDeadlineToDate(date.add(time));
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
      Provider.of<EditDeadlineProvider>(context, listen: false)
          .changeDeadlineToDate(date.add(time));
      return date.add(time);
    }
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(deadlineDate,
        pickDate: pickDate, firstDate: pickDate ? deadlineDate : null);
    if (date == null) return;
    setState(() {
      deadlineDate = date;
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
                  const Text("Jusqu'au :",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: buildDropDownField(
                          text: DateHourUtils.toDate(deadlineDate),
                          onClicked: () {
                            pickToDateTime(pickDate: true);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildDropDownField(
                          text: DateHourUtils.toTime(deadlineDate),
                          onClicked: () {
                            pickToDateTime(pickDate: false);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 10),
          TagsChoiceDeadlineWidget(
            myCustomTagName:
                (myCustomTagName.isNotEmpty) ? myCustomTagName : null,
          ),
        ],
      ),
    );
  }
}
