import 'package:AllUni/Calendars/Editing/DeadlineWidget.dart';
import 'package:AllUni/Calendars/Editing/PlanningWidget.dart';
import 'package:AllUni/Models/EventsModel.dart';
import 'package:AllUni/Providers/DeadlineTagsProvider.dart';
import 'package:AllUni/Providers/EventTagsProvider.dart';
import 'package:AllUni/Providers/TypeEventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TypeEventChoiceWidget extends StatelessWidget {
  const TypeEventChoiceWidget({
    Key? key,
    this.events,
    //required this.onPressedButton,
  }) : super(key: key);

  final Event? events;
  //final Function onPressedButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 32,
                children: [
                  ...(context
                      .watch<TypeEventProvider>()
                      .typeEvent
                      .map(
                        (typeEventItem) => InputChip(
                          avatar: typeEventItem.showedIcon,
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
                                .read<EventTagsProvider>()
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
        context.watch<TypeEventProvider>().currentActive == 'Planning'
            ? PlanningWidget()
            : DeadlineWidget()
      ],
    );
  }
}
