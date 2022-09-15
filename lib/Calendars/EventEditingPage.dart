import 'package:all_uni_dev/Pages/CalendarPages/DatabaseLoadPage.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:all_uni_dev/Calendars/widgets/TypeEventChoiceWidget.dart';
import 'package:all_uni_dev/Calendars/EventViewingPopUp.dart';
import 'package:all_uni_dev/Providers/CustomTagProvider.dart';
import 'package:all_uni_dev/Providers/DeadlineTagsProvider.dart';
import 'package:all_uni_dev/Providers/EditProvider.dart';
import 'package:all_uni_dev/Providers/PlanningTagsProvider.dart';
import 'package:all_uni_dev/Providers/TypeEventProvider.dart';
import 'package:all_uni_dev/Utils/Calendar/localLessonHandler.dart';
import 'package:all_uni_dev/Utils/HeroDialog.dart';
import 'package:flutter/material.dart';
import 'package:all_uni_dev/models/LocalLesson.dart';
import 'package:provider/provider.dart';

class EventEditingPage extends StatefulWidget {
  final LocalLesson? lesson;
  const EventEditingPage({
    Key? key,
    this.lesson,
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
  final LocalizationController = TextEditingController();
  late List<String> tagsNames;
  String myCustomTagName = "";

  @override
  void initState() {
    super.initState();
    if (widget.lesson == null) {
      appointmentType = "Planning";
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 1));
      deadlineDate = DateTime.now();
      tagsNames = [];
    } else {
      print("event edit lesson nomcours ${widget.lesson!}");
      appointmentType = "Planning";
      titleController.text = widget.lesson!.NomCours!;
      descriptionController.text = widget.lesson!.Professeur!;
      fromDate = DateTime.parse(widget.lesson!.HeureDebut.toString());
      toDate = DateTime.parse(widget.lesson!.HeureFin.toString());
      deadlineDate = DateTime.parse(widget.lesson!.HeureDebut.toString());
      LocalizationController.text = widget.lesson!.Salle!;
      tagsNames = widget.lesson!.Tags!;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    LocalizationController.dispose();
    super.dispose();
  }

  void _resetAllValues() {
    context.read<EditPlanningProvider>().resetAllPlanningValues();
    context.read<EditDeadlineProvider>().resetAllDeadlineValues();
    context.read<PlanningTagsProvider>().resetAllTagValue();
    context.read<DeadlineTagsProvider>().resetAllTagValue();
    Provider.of<TypeEventProvider>(context, listen: false).refreshEventTypeValue();
    Provider.of<CustomTagProvider>(context, listen: false).deleteTagValue();
  }

  @override
  Widget build(BuildContext context) {


    // UTILS FOR THE EVENT EDITING PAGE
    Future saveAppointmentForm(String type) async {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        late LocalLesson lesson;
        if (type == "Planning") {
          fromDate = Provider.of<EditPlanningProvider>(context, listen: false).getPlanningFromDate;
          toDate = Provider.of<EditPlanningProvider>(context, listen: false).getPlanningToDate;
          LocalizationController.text = Provider.of<EditPlanningProvider>(context, listen: false).getPlanningLocalization;
          tagsNames = Provider.of<PlanningTagsProvider>(context, listen: false).activatedTags;
          if (Provider.of<CustomTagProvider>(context, listen: false).getCustomTagLength !=0) {
            myCustomTagName =Provider.of<CustomTagProvider>(context, listen: false).customActivatedTag;
            tagsNames.add(myCustomTagName);
          }
          lesson = LocalLesson(
            UserID: "",
            TypeBloc: "Planning",
            NomCours: titleController.text,
            Professeur: descriptionController.text,
            HeureDebut: TemporalDateTime((fromDate.isBefore(toDate)) ? fromDate : toDate),
            HeureFin: TemporalDateTime((toDate.isAfter(fromDate)) ? toDate : fromDate),
            Salle: LocalizationController.text,
            Tags: tagsNames,
          );
        } else if (type == "Deadline") {
          deadlineDate = Provider.of<EditDeadlineProvider>(context, listen: false).getDeadlineToDate;
          tagsNames = Provider.of<DeadlineTagsProvider>(context, listen: false).activatedTags;
          if (Provider.of<CustomTagProvider>(context, listen: false).getCustomTagLength !=0) {
            myCustomTagName = Provider.of<CustomTagProvider>(context, listen: false).customActivatedTag;
            tagsNames.add(myCustomTagName);
          }
          lesson = LocalLesson(
            UserID: "",
            TypeBloc: "Deadline",
            NomCours: titleController.text,
            Professeur: descriptionController.text,
            HeureDebut: TemporalDateTime(deadlineDate),
            HeureFin: TemporalDateTime(deadlineDate),
            Salle: "",
            Tags: tagsNames,
          );
        }

        final isEditing = widget.lesson != null;
        if (isEditing) {
          LocalLessonHandler().updateLocalLesson(lesson, widget.lesson!);
          Navigator.of(context).push(
            HeroDialogRoute(
              builder: (context) => Center(
                child: EventViewingPopUp(
                  lesson: lesson,
                ),
              ),
            ),
          );
        } else {
          print("not editing");
          LocalLessonHandler().createLocalLesson(lesson);
          Navigator.of(context).pop;
          Navigator.of(context).pop;}
        _resetAllValues();
      }
    }

    if (context.watch<TypeEventProvider>().currentActive == "Planning") {
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
    } else if (context.watch<TypeEventProvider>().currentActive == "Deadline") {
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
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.save),
              onTap: () {
                if (Provider.of<TypeEventProvider>(context, listen: false).currentActive ==
                    "Planning") {
                  saveAppointmentForm("Planning");
                } else if (Provider.of<TypeEventProvider>(context, listen: false).currentActive ==
                    "Deadline") {
                  saveAppointmentForm("Deadline");
                } else {
                  return;
                }
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => DatabaseLoadPage(["1A"], 0, "Mon Calendrier")));
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