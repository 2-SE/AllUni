import 'package:flutter/material.dart';
import 'package:alluni/Calendars/EventViewingPopUp.dart';
import 'package:alluni/Models/EventsModel.dart';
import 'package:alluni/Providers/EventProvider.dart';
import 'package:alluni/Utils/HeroDialog.dart';
import 'package:provider/provider.dart';

import '../Utils/DateHourUtils.dart';

class EventEditingPage extends StatefulWidget {
  final PersonalEvent? event;
  const EventEditingPage({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  late bool isAllDay;

  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 1));
      isAllDay = false;
    } else {
      final event = widget.event!;
      titleController.text = event.title;
      descriptionController.text = event.description;
      fromDate = event.fromDate;
      toDate = event.toDate;
      isAllDay = event.isAllDay;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isSelected = [false, false, false];

    // UTILS FOR THE EVENT EDITING PAGE
    Future saveForm() async {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        final event = PersonalEvent(
          title: titleController.text,
          description: descriptionController.text,
          tag: "",
          fromDate: fromDate,
          toDate: toDate,
          isAllDay: isAllDay,
        );
        final isEditing = widget.event != null;
        final provider = Provider.of<EventProvider>(context, listen: false);

        if (isEditing) {
          provider.editEvent(event, widget.event!);
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).push(
            HeroDialogRoute(
              builder: (context) => Center(
                child: EventViewingPopUp(event: event),
              ),
            ),
          );
          //Navigator.of(context).pop();
        } else {
          provider.addEvent(event);
          Navigator.of(context).pop();
        }
        //Navigator.of(context).pop();
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
        toDate = DateTime(
            date.year, date.month, date.day, toDate.hour, toDate.minute);
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

    // THE VIEW
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout dans mon Calendrier"),
        backgroundColor: const Color(0xFF4C75A0),
        foregroundColor: Colors.white,
        leading: const CloseButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.save),
              onTap: () {
                saveForm();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Titre",
                ),
                style: const TextStyle(fontSize: 28),
                autocorrect: true,
                maxLength: 128,
                minLines: 1,
                maxLines: 2,
                controller: titleController,
                validator: (String? title) {
                  if (title != null && title.isEmpty) {
                    return "Le titre ne peut pas être vide";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Description",
                ),
                style: const TextStyle(fontSize: 18),
                autocorrect: true,
                maxLength: 1024,
                minLines: 1,
                maxLines: 8,
                controller: descriptionController,
              ),
              Container(height: 10, color: Colors.transparent),
              //EventEditingType(isSelected: [true, false], isEditing: false),
              CheckboxListTile(
                title: const Text(
                  "Journée entière ?",
                ),
                controlAffinity: ListTileControlAffinity.leading,
                secondary: const Icon(Icons.edit_calendar_rounded),
                value: isAllDay,
                onChanged: (value) {
                  setState(() {
                    isAllDay = value ?? false;
                  });
                },
                activeColor: Colors.lightGreen,
                checkColor: Colors.white,
              ),
              Container(height: 10, color: Colors.transparent),
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
                      Container(height: 12, color: Colors.transparent),
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
              Container(height: 10, color: Colors.transparent),
              const Divider(),
              Container(height: 10, color: Colors.transparent),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.library_add_rounded),
                      Text(
                        " Tags :  ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  /*
                  //A REVOIR POUR QUE ÇA SOIT BIEN
                  ToggleButtons(
                    selectedColor: Colors.indigo,
                    renderBorder: false,
                    isSelected: isSelected,
                    onPressed: (int index) {
                      setState(() {
                        print("$index");
                        if (isSelected[index] == true) {
                          isSelected[index] = false;
                        } else {
                          isSelected[index] = true;
                        }
                        //isSelected[index] = !isSelected[index];
                        print("${isSelected}");
                        /*
                        if (isSelected[index] == true) {
                          isSelected[index] = false;
                        } else {
                          isSelected[index] = true;
                        }
                        */
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 24,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                "  Perso  ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 24,
                            color: const Color(0xFF6D071A),
                            child: const Center(
                              child: Text(
                                "  Travail  ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 24,
                            color: Colors.green,
                            child: const Center(
                              child: Text(
                                "  Événement  ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  */
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
