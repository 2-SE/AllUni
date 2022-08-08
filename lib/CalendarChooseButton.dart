import 'package:flutter/material.dart';

class CalendarChooseButton extends StatefulWidget {
  @override
  State<CalendarChooseButton> createState() => _CalendarChooseButtonState();
}

class _CalendarChooseButtonState extends State<CalendarChooseButton> {
  List<bool> isSelected = [false,false,false,false,false]; //???

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.indigo.withOpacity(0.15),
      child: ToggleButtons(
        isSelected: isSelected,
        fillColor: Colors.indigo,
        selectedColor: Colors.white,
        renderBorder: false,
        color: Colors.black,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.calendar_view_day_rounded),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.amp_stories),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.view_column_outlined),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.calendar_view_week_rounded),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.calendar_month_outlined),
          ),
        ],
        onPressed: (int SelectedButtonIndex) {
          setState(() {
            for (int index = 0; index < isSelected.length; index++) {
              if (index == SelectedButtonIndex) {
                isSelected[index] = true;
              } else {
                isSelected[index] = false;
              }
            }
            print(isSelected);
          });
        },
      ),
    );
  }
}
