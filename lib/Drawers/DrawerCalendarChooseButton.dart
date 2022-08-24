import 'package:alluni/Calendars/Calendar.dart';
import 'package:flutter/material.dart';

class DrawerCalendarChooseButton extends StatefulWidget {
  String currentView = "";
  List<bool> isSelected = [];
  DrawerCalendarChooseButton({
    super.key,
    required this.currentView,
    required this.isSelected,
  });

  @override
  State<DrawerCalendarChooseButton> createState() =>
      _DrawerCalendarChooseButtonState();
}

class _DrawerCalendarChooseButtonState
    extends State<DrawerCalendarChooseButton> {
  @override
  Widget build(BuildContext context) {
    var isSelected = widget.isSelected;
    var currentView = widget.currentView;
    return Container(
      alignment: Alignment.center,
      color: Colors.indigo.withOpacity(0.15),
      child: ToggleButtons(
        isSelected: isSelected,
        fillColor: Color(0xFF4C75A0),
        selectedColor: Colors.white,
        renderBorder: false,
        color: Colors.black,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.calendar_view_day_rounded),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.amp_stories),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.calendar_view_week_rounded),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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

            if (widget.currentView == "FreeRooms") {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Information : \nLe changement de type de vue ne peut être mis en place que pour les calendriers tels que celui personnel, des autres promotions ou encore celui de l'école.",
                  ),
                ),
              );
            } else {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) =>
                          Calendar(currentView, SelectedButtonIndex)))
                  .then((_) {
                setState(() {});
              });
            }
          });
        },
      ),
    );
  }
}
