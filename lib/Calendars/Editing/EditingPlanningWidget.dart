import 'package:AllUni/Calendars/Editing/TagChoicePlanningWidget.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Providers/EditProvider.dart';
import 'package:AllUni/Utils/DateHourUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditingPlanningWidget extends StatefulWidget {
  final CalendarAppointment? calendarAppointment;
  const EditingPlanningWidget({
    Key? key,
    this.calendarAppointment,
  }) : super(key: key);

  @override
  State<EditingPlanningWidget> createState() => _EditingPlanningWidgetState();
}

class _EditingPlanningWidgetState extends State<EditingPlanningWidget> {
  final _formKey = GlobalKey<FormState>();
  late DateTime fromDate;
  late DateTime toDate;
  final localizationController = TextEditingController();
  late List<String> tagsNames;

  String myCustomTagName = "";

  @override
  void initState() {
    super.initState();
    if (widget.calendarAppointment == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 1));
      tagsNames = [];
    } else {
      final calendarAppointment = widget.calendarAppointment!;
      fromDate = calendarAppointment.fromDate;
      toDate = calendarAppointment.toDate;
      localizationController.text = calendarAppointment.localization;
      tagsNames = calendarAppointment.tagsNames;
    }
  }

  @override
  void dispose() {
    localizationController.dispose();
    super.dispose();
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
      if (whichDate == "to") {
        Provider.of<EditPlanningProvider>(context, listen: false)
            .changePlanningToDate(date.add(time));
      } else if (whichDate == "from") {
        Provider.of<EditPlanningProvider>(context, listen: false)
            .changePlanningFromDate(date.add(time));
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
      if (whichDate == "to") {
        Provider.of<EditPlanningProvider>(context, listen: false)
            .changePlanningToDate(date.add(time));
      } else if (whichDate == "from") {
        Provider.of<EditPlanningProvider>(context, listen: false)
            .changePlanningFromDate(date.add(time));
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
      Provider.of<EditPlanningProvider>(context, listen: false)
          .changePlanningToDate(toDate);
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
                  const Text("Du :",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: buildDropDownField(
                          text: DateHourUtils.toDate(fromDate),
                          onClicked: () {
                            pickFromDateTime(pickDate: true);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildDropDownField(
                          text: DateHourUtils.toTime(fromDate),
                          onClicked: () {
                            pickFromDateTime(pickDate: false);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text("Au :",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: buildDropDownField(
                          text: DateHourUtils.toDate(toDate),
                          onClicked: () {
                            pickToDateTime(pickDate: true);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildDropDownField(
                          text: DateHourUtils.toTime(toDate),
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
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: "Lieu",
            ),
            style: const TextStyle(fontSize: 18),
            autocorrect: true,
            minLines: 1,
            maxLines: 2,
            onChanged: (localization) {
              Provider.of<EditPlanningProvider>(context, listen: false)
                  .changePlanningLocalization(localization);
            },
            controller: localizationController,
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          TagsChoicePlanningWidget(
            myCustomTagName:
                (myCustomTagName.isNotEmpty) ? myCustomTagName : null,
          ),
        ],
      ),
    );
  }
}
