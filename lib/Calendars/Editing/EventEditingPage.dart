import 'package:AllUni/Calendars/Editing/TypeEventChoiceWidget.dart';
import 'package:AllUni/Calendars/EventViewingPopUp.dart';
import 'package:AllUni/Models/EventsModel.dart';
import 'package:AllUni/Providers/EventProvider.dart';
import 'package:AllUni/Utils/HeroDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventEditingPage extends StatefulWidget {
  final Event? event;
  final String? myCustomTagName;
  const EventEditingPage({
    Key? key,
    this.event,
    this.myCustomTagName,
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

  @override
  Widget build(BuildContext context) {
    // UTILS FOR THE EVENT EDITING PAGE
    Future saveForm() async {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        final event = Event(
          title: titleController.text,
          description: descriptionController.text,
          fromDate: fromDate,
          toDate: toDate,
          localization: localizationController.text,
          tagsNames: tagsNames,
        );
        print(titleController.text);
        print(descriptionController.text);
        print(fromDate.toString());
        print(toDate.toString());
        print(localizationController.text);
        print(tagsNames);
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
                maxLength: 100,
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
                maxLength: 500,
                minLines: 1,
                maxLines: 8,
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
