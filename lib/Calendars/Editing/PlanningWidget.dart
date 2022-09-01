import 'package:AllUni/Calendars/Editing/EventTagsChoiceWidget.dart';
import 'package:AllUni/Models/EventsModel.dart';
import 'package:AllUni/Utils/DateHourUtils.dart';
import 'package:flutter/material.dart';

class PlanningWidget extends StatefulWidget {
  final Event? event;
  const PlanningWidget({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  State<PlanningWidget> createState() => _PlanningWidgetState();
}

class _PlanningWidgetState extends State<PlanningWidget> {
  //final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  final localizationController = TextEditingController();
  late List<String> tagsNames;
  String myCustomTagName = "";

  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 1));
      tagsNames = [];
    } else {
      final event = widget.event!;
      titleController.text = event.title;
      descriptionController.text = event.description;
      fromDate = event.fromDate;
      toDate = event.toDate;
      localizationController.text = event.localization;
      tagsNames = event.tagsNames;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
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
      return date.add(time);
    }
  }

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;
    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
    setState(() {
      fromDate = date;
    });
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;
    setState(() {
      toDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: localizationController,
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        EventTagsChoiceWidget(
          myCustomTagName:
              (myCustomTagName.isNotEmpty) ? myCustomTagName : null,
        ),
      ],
    );
  }
}
