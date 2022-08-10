import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Drawers/DrawerFreeRoomsCalendarView.dart';


class FreeRoomsCalendar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Salles Libres'),
        backgroundColor: Color(0xFF4C75A0),
        //elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0:0.0,
      ),
      drawer: DrawerFreeRoomsView(),
      //BODY PART
      body: Center(
        child: Text("FreeRoom List Here Soon"),
      ),

    );
  }
}