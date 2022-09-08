import 'package:AllUni/Calendars/Editing/EditingDeadlineWidget.dart';
import 'package:AllUni/Calendars/Editing/EditingPlanningWidget.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Providers/DeadlineTagsProvider.dart';
import 'package:AllUni/Providers/PlanningTagsProvider.dart';
import 'package:AllUni/Providers/TypeEventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TypeEventChoiceWidget extends StatefulWidget {
  final CalendarAppointment? calendarAppointment;
  final String? myCustomTagName;
  const TypeEventChoiceWidget({
    Key? key,
    this.calendarAppointment,
    this.myCustomTagName,
  }) : super(key: key);

  @override
  State<TypeEventChoiceWidget> createState() => _TypeEventChoiceWidgetState();
}

class _TypeEventChoiceWidgetState extends State<TypeEventChoiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: MediaQuery.of(context).size.width * 0.1,
                children: [
                  ...(context
                      .watch<TypeEventProvider>()
                      .typeEvent
                      .map(
                        (typeEventItem) => InputChip(
                          avatar: typeEventItem.showedIcon,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          label: Text(
                            typeEventItem.label,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: typeEventItem.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          visualDensity: const VisualDensity(vertical: -2),
                          showCheckmark: false,
                          selectedColor: typeEventItem.selectedColor,
                          selected: typeEventItem.value,
                          onPressed: () {
                            context
                                .read<TypeEventProvider>()
                                .changeEventTypeValue(typeEventItem);
                            context
                                .read<PlanningTagsProvider>()
                                .resetAllTagValue();
                            context
                                .read<DeadlineTagsProvider>()
                                .resetAllTagValue();
                          },
                        ),
                      )
                      .toList()),
                ],
              ),
            ),
          ],
        ),
        context.read<TypeEventProvider>().currentActive == 'Planning'
            ? const EditingPlanningWidget()
            : const EditingDeadlineWidget()
      ],
    );
  }
}
