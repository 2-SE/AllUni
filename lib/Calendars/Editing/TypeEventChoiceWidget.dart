import 'package:AllUni/Calendars/Editing/EditingDeadlineWidget.dart';
import 'package:AllUni/Calendars/Editing/EditingPlanningWidget.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Providers/DeadlineTagsProvider.dart';
import 'package:AllUni/Providers/PlanningTagsProvider.dart';
import 'package:AllUni/Providers/TypeEventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TypeEventChoiceWidget extends StatelessWidget {
  final CalendarAppointment? calendarAppointment;
  const TypeEventChoiceWidget({
    Key? key,
    required this.calendarAppointment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TypeEventProvider typeEventProvider = context.watch<TypeEventProvider>();
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: MediaQuery.of(context).size.width * 0.1,
                children: [
                  ...(typeEventProvider.typeEvent
                      .map(
                        (typeEventItem) => InputChip(
                          avatar: (calendarAppointment != null &&
                                  calendarAppointment!.appointmentType ==
                                      typeEventItem.label)
                              ? typeEventItem.iconChecked
                              : (calendarAppointment != null &&
                                      calendarAppointment!.appointmentType !=
                                          typeEventItem.label)
                                  ? typeEventItem.iconNonChecked
                                  : typeEventItem.showedIcon,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          label: Text(
                            typeEventItem.label,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: (calendarAppointment != null &&
                                      calendarAppointment!.appointmentType ==
                                          typeEventItem.label)
                                  ? Colors.white
                                  : (calendarAppointment != null &&
                                          calendarAppointment!
                                                  .appointmentType !=
                                              typeEventItem.label)
                                      ? Colors.black
                                      : (calendarAppointment == null &&
                                              typeEventItem.value == true)
                                          ? Colors.white
                                          : (calendarAppointment == null &&
                                                  typeEventItem.value == false)
                                              ? Colors.black
                                              : Colors.grey, //ERROR NORMALLY
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          visualDensity: const VisualDensity(vertical: -2),
                          showCheckmark: false,
                          selectedColor: typeEventItem.selectedColor,
                          selected: (calendarAppointment != null &&
                                  calendarAppointment!.appointmentType ==
                                      typeEventItem.label)
                              ? true
                              : (calendarAppointment != null &&
                                      calendarAppointment!.appointmentType !=
                                          typeEventItem.label)
                                  ? false
                                  : typeEventItem.value,
                          onPressed: () {
                            typeEventProvider
                                .changeEventTypeValue(typeEventItem);
                            context
                                .read<PlanningTagsProvider>()
                                .resetAllTagValue();
                            context
                                .read<DeadlineTagsProvider>()
                                .resetAllTagValue();
                          },
                          isEnabled:
                              (calendarAppointment == null) ? true : false,
                        ),
                      )
                      .toList()),
                ],
              ),
            ),
          ],
        ),

        (calendarAppointment != null &&
                calendarAppointment!.appointmentType == "Planning")
            ? EditingPlanningWidget(
                calendarAppointment: calendarAppointment,
              )
            : (calendarAppointment != null &&
                    calendarAppointment!.appointmentType == "Deadline")
                ? EditingDeadlineWidget(
                    calendarAppointment: calendarAppointment,
                  )
                : (typeEventProvider.currentActive == "Planning")
                    ? EditingPlanningWidget()
                    : (typeEventProvider.currentActive == "Deadline")
                        ? EditingDeadlineWidget()
                        : const Text("# ERROR #"), // NORMALLY DON'T GO HERE
      ],
    );
  }
}
