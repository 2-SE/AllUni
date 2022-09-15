import 'package:all_uni_dev/Calendars/widgets/EditingDeadlineWidget.dart';
import 'package:all_uni_dev/Calendars/widgets/EditingPlanningWidget.dart';
import 'package:all_uni_dev/Providers/DeadlineTagsProvider.dart';
import 'package:all_uni_dev/Providers/PlanningTagsProvider.dart';
import 'package:all_uni_dev/Providers/TypeEventProvider.dart';
import 'package:flutter/material.dart';
import 'package:all_uni_dev/models/LocalLesson.dart';
import 'package:provider/provider.dart';

class TypeEventChoiceWidget extends StatelessWidget {
  final LocalLesson? lesson;
  final String? myCustomTagName;
  const TypeEventChoiceWidget({
    Key? key,
    this.lesson,
    this.myCustomTagName,
  }) : super(key: key);

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
        context.watch<TypeEventProvider>().currentActive == 'Planning'
            ? const EditingPlanningWidget()
            : const EditingDeadlineWidget()
      ],
    );
  }
}