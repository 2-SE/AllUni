import 'package:AllUni/Providers/TypeEventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TypeEventChoiceWidget extends StatefulWidget {
  late String? myCustomTagName;
  TypeEventChoiceWidget({
    Key? key,
    this.myCustomTagName,
  }) : super(key: key);

  @override
  State<TypeEventChoiceWidget> createState() => _TypeEventChoiceWidgetState();
}

class _TypeEventChoiceWidgetState extends State<TypeEventChoiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
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
                          color:
                              typeEventItem.value ? Colors.white : Colors.black,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      visualDensity: const VisualDensity(vertical: -2),
                      showCheckmark: false,
                      selectedColor: typeEventItem.selectedColor,
                      selected: typeEventItem.value,
                      onPressed: () {},
                    ),
                  )
                  .toList())
            ],
          ),
        ),
      ],
    );
  }
}
