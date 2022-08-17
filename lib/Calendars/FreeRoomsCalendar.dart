import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Drawers/DrawerCalendarView.dart';

class FreeRoomsCalendar extends StatelessWidget {
  const FreeRoomsCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salles Libres'),
        backgroundColor: const Color(0xFF4C75A0),
        //elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0:0.0,
      ),
      drawer: DrawerCalendarView(
        currentView: "FreeRooms",
        isSelectedFormat: [true, false, false, false],
      ),
      //BODY PART
      body: const Center(
        child: Text("FreeRoom List Here Soon"),
      ),
    );
  }
}
