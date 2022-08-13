import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Drawers/DrawerCalendarView.dart';


class FreeRoomsCalendar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Salles Libres'),
        backgroundColor: Color(0xFF4C75A0),
        //elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0:0.0,
      ),
      drawer: DrawerCalendarView(
        currentView: "FreeRooms",
        isSelectedFormat: [true,false,false,false,false],
      ),
      //BODY PART
      body: Center(
        child: Text("FreeRoom List Here Soon"),
      ),

    );
  }
}