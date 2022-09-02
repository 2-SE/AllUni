import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/models/Lesson.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Lesson> appointments) {this.appointments = appointments;}

  Lesson getLesson(int index) => appointments![index] as Lesson;

  @override
  String getTitle(int index) => getLesson(index).NomCours!;

  @override
  String getDescription(int index) => getLesson(index).Professeur!;

  @override
  DateTime getStartTime(int index) => getLesson(index).HeureDebut!;

  @override
  DateTime getEndTime(int index) => getLesson(index).HeureFin!;

  @override
  bool isAllDay(int index) => false;

  @override
  Color getColor(int index) {
    Color c = Colors.white;
    var type = getLesson(index).TypeBloc;
    switch(type){
      case "COURS":
        c = Colors.green;
        break;
      case "<empty>":
        c = Colors.grey;
        break;
    }
    return c;
  }
}