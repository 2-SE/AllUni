import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/models/Event.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }

  Event getEvent(int index) => appointments![index] as Event;

  @override
  String getID(int index) => getEvent(index).id;//obl

  @override
  String? getCampusID(int index) => getEvent(index).CampusID;

  @override
  String? getMajeureID(int index) => getEvent(index).MajeureID;

  @override
  String? getCoursID(int index) => getEvent(index).CoursID;

  @override
  List<String>? getUserID(int index) => getEvent(index).UserID;

  @override
  String getTitre(int index) => getEvent(index).Titre;//obl

  @override
  String? getHote(int index) => getEvent(index).Hote;

  @override
  String? getPosition(int index) => getEvent(index).Position;

  @override
  String? getType(int index) => getEvent(index).Type;

  @override
  String? getTypeCours(int index) => getEvent(index).TypeCours;

  @override
  String? getDescription(int index) => getEvent(index).Description;

  @override
  String? getComments(int index) => getEvent(index).Comments;

  @override
  DateTime getStartTime(int index) => DateTime.parse(getEvent(index).HeureDebut.toString());//ob

  @override
  DateTime getEndTime(int index) => DateTime.parse(getEvent(index).HeureFin.toString());

  @override
  bool? getisAllDay(int index) => getEvent(index).isAllDay;

  @override
  List<String>? getTag(int index) => getEvent(index).Tag;

}

