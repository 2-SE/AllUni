import 'package:AllUni/Calendars/EditingPages/EditingDeadlineWidget.dart';
import 'package:AllUni/Calendars/EditingPages/EditingPlanningWidget.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Providers/TypeAppointmentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TypeAppointmentChoiceWidget extends StatelessWidget {
  final CalendarAppointment calendarEditAppointment;
  const TypeAppointmentChoiceWidget({
    Key? key,
    required this.calendarEditAppointment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TypeAppointmentProvider typeAppointmentProvider =
        context.watch<TypeAppointmentProvider>();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: MediaQuery.of(context).size.width * 0.1,
                children: [
                  ...(typeAppointmentProvider.typeAppointment
                      .map(
                        (typeAppointmentItem) => InputChip(
                          avatar: (calendarEditAppointment.appointmentType ==
                                  typeAppointmentItem.label)
                              ? typeAppointmentItem.iconChecked
                              : (calendarEditAppointment.appointmentType !=
                                      typeAppointmentItem.label)
                                  ? typeAppointmentItem.iconNonChecked
                                  : typeAppointmentItem.showedIcon,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          label: Text(
                            typeAppointmentItem.label,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: (calendarEditAppointment.appointmentType ==
                                      typeAppointmentItem.label)
                                  ? Colors.white
                                  : (calendarEditAppointment.appointmentType !=
                                          typeAppointmentItem.label)
                                      ? Colors.black
                                      : (typeAppointmentItem.value == true)
                                          ? Colors.white
                                          : (typeAppointmentItem.value == false)
                                              ? Colors.black
                                              : Colors.grey, //ERROR NORMALLY
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          visualDensity: const VisualDensity(vertical: -2),
                          showCheckmark: false,
                          selectedColor: typeAppointmentItem.selectedColor,
                          selected: (calendarEditAppointment.appointmentType ==
                                  typeAppointmentItem.label)
                              ? true
                              : (calendarEditAppointment.appointmentType !=
                                      typeAppointmentItem.label)
                                  ? false
                                  : typeAppointmentItem.value,
                          onPressed: () {
                            //RESET DES VALUES - from-to-deadline + localization + tags
                            typeAppointmentProvider
                                .changeEventTypeValue(typeAppointmentItem);
                            calendarEditAppointment.appointmentType =
                                typeAppointmentProvider.currentActive;
                          },
                          isEnabled: calendarEditAppointment.isFixedType,
                        ),
                      )
                      .toList()),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        (calendarEditAppointment.appointmentType == "Planning")
            ? EditingPlanningWidget(
                calendarEditAppointment: calendarEditAppointment,
              )
            : (calendarEditAppointment.appointmentType == "Deadline")
                ? EditingDeadlineWidget(
                    calendarEditAppointment: calendarEditAppointment,
                  )
                : Container(), // POUR L'AFFICHAGE DES INFOS DES COURS LORS DE L'AJOUT D'ANNOTATIONS
      ],
    );
  }
}
