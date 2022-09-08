import 'package:AllUni/Calendars/Editing/TypeEventChoiceWidget.dart';
import 'package:AllUni/Calendars/Viewing/EventViewingPopUp.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Providers/CalendarAppointmentsProvider.dart';
import 'package:AllUni/Providers/CustomTagProvider.dart';
import 'package:AllUni/Providers/DeadlineTagsProvider.dart';
import 'package:AllUni/Providers/EditProvider.dart';
import 'package:AllUni/Providers/PlanningTagsProvider.dart';
import 'package:AllUni/Providers/TypeEventProvider.dart';
import 'package:AllUni/Utils/HeroDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventEditingPage extends StatefulWidget {
  final CalendarAppointment? calendarAppointment;
  const EventEditingPage({
    Key? key,
    this.calendarAppointment,
  }) : super(key: key);

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  late String appointmentType;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  late DateTime deadlineDate;
  final localizationController = TextEditingController();
  late List<String> tagsNames;
  String myCustomTagName = "";

  @override
  void initState() {
    super.initState();
    if (widget.calendarAppointment == null) {
      appointmentType = "Planning";
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 1));
      deadlineDate = DateTime.now();
      tagsNames = [];
    } else {
      final calendarAppointment = widget.calendarAppointment!;
      appointmentType = calendarAppointment.appointmentType;
      titleController.text = calendarAppointment.title;
      descriptionController.text = calendarAppointment.description;
      fromDate = calendarAppointment.fromDate;
      toDate = calendarAppointment.toDate;
      deadlineDate = calendarAppointment.deadlineDate;
      localizationController.text = calendarAppointment.localization;
      tagsNames = calendarAppointment.tagsNames;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    localizationController.dispose();
    super.dispose();
  }

  void _resetAllValues() {
    context.read<EditPlanningProvider>().resetAllPlanningValues();
    context.read<EditDeadlineProvider>().resetAllDeadlineValues();
    context.read<PlanningTagsProvider>().resetAllTagValue();
    context.read<DeadlineTagsProvider>().resetAllTagValue();
    Provider.of<TypeEventProvider>(context, listen: false)
        .refreshEventTypeValue();
    Provider.of<CustomTagProvider>(context, listen: false).deleteTagValue();
  }

  @override
  Widget build(BuildContext context) {
    // UTILS FOR THE EVENT EDITING PAGE
    Future saveAppointmentForm(String type) async {
      final isValid = _formKey.currentState!.validate();
      final EditPlanningProvider planningEditProvider =
          context.read<EditPlanningProvider>();
      final EditDeadlineProvider deadlineEditProvider =
          context.read<EditDeadlineProvider>();
      final CustomTagProvider customTagsProvider =
          context.read<CustomTagProvider>();

      if (isValid) {
        late CalendarAppointment calendarAppointment;
        if (type == "Planning") {
          fromDate = planningEditProvider.getPlanningFromDate;
          toDate = planningEditProvider.getPlanningToDate;
          localizationController.text =
              planningEditProvider.getPlanningLocalization;
          tagsNames = context.read<PlanningTagsProvider>().activatedTags;
          if (customTagsProvider.getCustomTagLength != 0) {
            myCustomTagName = customTagsProvider.customActivatedTag;
            tagsNames.add(myCustomTagName);
          }
          calendarAppointment = CalendarAppointment(
            appointmentType: "Planning",
            title: titleController.text,
            description: descriptionController.text,
            fromDate: (fromDate.isBefore(toDate)) ? fromDate : toDate,
            toDate: (toDate.isAfter(fromDate)) ? toDate : fromDate,
            deadlineDate: (fromDate.isBefore(toDate)) ? fromDate : toDate,
            localization: localizationController.text,
            tagsNames: tagsNames,
          );
        } else if (type == "Deadline") {
          deadlineDate = deadlineEditProvider.getDeadlineToDate;
          tagsNames = context.read<DeadlineTagsProvider>().activatedTags;
          if (customTagsProvider.getCustomTagLength != 0) {
            myCustomTagName = customTagsProvider.customActivatedTag;
            tagsNames.add(myCustomTagName);
          }
          calendarAppointment = CalendarAppointment(
            appointmentType: "Deadline",
            title: titleController.text,
            description: descriptionController.text,
            fromDate: deadlineDate,
            toDate: deadlineDate,
            deadlineDate: deadlineDate,
            localization: "",
            tagsNames: tagsNames,
          );
        }

        final isEditing = widget.calendarAppointment != null;
        final provider =
            Provider.of<CalendarAppointmentsProvider>(context, listen: false);

        if (isEditing) {
          provider.editAppointment(
              calendarAppointment, widget.calendarAppointment!);
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).push(
            HeroDialogRoute(
              builder: (context) => Center(
                child: EventViewingPopUp(
                  calendarAppointment: calendarAppointment,
                ),
              ),
            ),
          );
        } else {
          provider.addAppointment(calendarAppointment);
          Navigator.of(context).pop();
        }
        _resetAllValues();
      }
    }

    if (context.read<TypeEventProvider>().currentActive == "Planning") {
      List<bool> isSelectedTags = [false, false, false, false];
      for (int index = 0; index < tagsNames.length; index++) {
        if (tagsNames[index] == "Perso") {
          isSelectedTags[0] = true;
        } else if (tagsNames[index] == "Travail") {
          isSelectedTags[1] = true;
        } else if (tagsNames[index] == "Événement") {
          isSelectedTags[2] = true;
        } else {
          isSelectedTags[3] = true;
          myCustomTagName = tagsNames[index];
        }
      }
    } else if (context.read<TypeEventProvider>().currentActive == "Deadline") {
      List<bool> isSelectedTags = [false, false, false, false];
      for (int index = 0; index < tagsNames.length; index++) {
        if (tagsNames[index] == "Perso") {
          isSelectedTags[0] = true;
        } else if (tagsNames[index] == "Travail") {
          isSelectedTags[1] = true;
        } else if (tagsNames[index] == "Urgent") {
          isSelectedTags[2] = true;
        } else {
          isSelectedTags[3] = true;
          myCustomTagName = tagsNames[index];
        }
      }
    }

    // THE VIEW
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout dans mon Calendrier"),
        backgroundColor: const Color(0xFF4C75A0),
        foregroundColor: Colors.white,
        leading: CloseButton(
          onPressed: () {
            _resetAllValues();
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.save),
              onTap: () {
                if (Provider.of<TypeEventProvider>(context, listen: false)
                        .currentActive ==
                    "Planning") {
                  saveAppointmentForm("Planning");
                } else if (Provider.of<TypeEventProvider>(context,
                            listen: false)
                        .currentActive ==
                    "Deadline") {
                  saveAppointmentForm("Deadline");
                } else {
                  return;
                }
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
                maxLength: 100,
                minLines: 1,
                maxLines: 2,
                onChanged: (title) {
                  context
                      .read<EditPlanningProvider>()
                      .changePlanningTitle(title);
                },
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
                maxLength: 500,
                minLines: 1,
                maxLines: 8,
                onChanged: (description) {
                  context
                      .read<EditPlanningProvider>()
                      .changePlanningDescription(description);
                },
                controller: descriptionController,
              ),
              const SizedBox(height: 10),
              const TypeEventChoiceWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
