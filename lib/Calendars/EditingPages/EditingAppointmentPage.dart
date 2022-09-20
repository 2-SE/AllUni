import 'package:AllUni/Calendars/EditingPages/EditingTextField.dart';
import 'package:AllUni/Calendars/EditingPages/TypeAppointmentChoiceWidget.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Providers/DeadlineTagsProvider.dart';
import 'package:AllUni/Providers/PlanningTagsProvider.dart';
import 'package:AllUni/Providers/TypeAppointmentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EditingAppointmentPage extends StatelessWidget {
  EditingAppointmentPage({
    this.calendarAppointment,
    Key? key,
  }) : super(key: key);

  final CalendarAppointment? calendarAppointment;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CalendarAppointment calendarEditAppointment =
        calendarAppointment?.clone() ?? CalendarAppointment.emptyAppointment();

    // UTILS FOR THE EVENT EDITING PAGE
    Future saveAppointmentForm() async {
      final isValid = _formKey.currentState!.validate();

      if (isValid) {
        calendarEditAppointment = CalendarAppointment(
          id: (calendarAppointment != null)
              ? calendarEditAppointment.id
              : const Uuid().v1(),
          appointmentType: (calendarAppointment != null)
              ? calendarAppointment!.appointmentType
              : context.read<TypeAppointmentProvider>().currentActive,
          title: calendarEditAppointment.title.trim(),
          description: calendarEditAppointment.description.trim(),
          fromDate: (calendarEditAppointment.fromDate
                  .isBefore(calendarEditAppointment.toDate))
              ? calendarEditAppointment.fromDate
              : calendarEditAppointment.toDate,
          toDate: (calendarEditAppointment.toDate
                  .isAfter(calendarEditAppointment.fromDate))
              ? calendarEditAppointment.toDate
              : calendarEditAppointment.fromDate,
          deadlineDate: (calendarEditAppointment.toDate
                  .isAfter(calendarEditAppointment.fromDate))
              ? calendarEditAppointment.toDate
              : calendarEditAppointment.fromDate,
          localization: calendarEditAppointment.localization?.trim() ?? "",
          tagsNames: calendarEditAppointment.tagsNames,
        );
        context.read<TypeAppointmentProvider>().refreshEventTypeValue();
        context.read<PlanningTagsProvider>().resetAllTagValue();
        context.read<DeadlineTagsProvider>().resetAllTagValue();
        Navigator.pop(context, calendarEditAppointment);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          (calendarAppointment == null)
              ? "Ajout dans mon Calendrier"
              : (calendarAppointment != null &&
                      calendarAppointment!.appointmentType == "Planning")
                  ? "Modifier cet Événement"
                  : (calendarAppointment != null &&
                          calendarAppointment!.appointmentType == "Deadline")
                      ? "Modifier cette Deadline"
                      : "Ajouter une Annotation", // Pour plus tard quand on aura un cours
        ),
        backgroundColor: const Color(0xFF4C75A0),
        foregroundColor: Colors.white,
        leading: CloseButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.save),
              onTap: () {
                calendarEditAppointment.save();
                saveAppointmentForm();
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
              EditingTextField(
                labelText: "Titre",
                data: calendarEditAppointment.title,
                onUpdate: (value) {
                  calendarEditAppointment.title = value;
                },
              ),
              EditingTextField(
                labelText: "Description",
                data: calendarEditAppointment.description,
                onUpdate: (value) {
                  calendarEditAppointment.description = value;
                },
              ),
              const SizedBox(height: 15),
              TypeAppointmentChoiceWidget(
                calendarEditAppointment: calendarEditAppointment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
