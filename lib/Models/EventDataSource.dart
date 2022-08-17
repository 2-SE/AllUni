import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Models/EventModel.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }

  Event getEvent(int index) => appointments![index] as Event;

  @override
  String getTitle(int index) => getEvent(index).title;

  @override
  String getDescription(int index) => getEvent(index).description;

  @override
  DateTime getStartTime(int index) => getEvent(index).fromDate;

  @override
  DateTime getEndTime(int index) => getEvent(index).toDate;

  @override
  bool isAllDay(int index) => getEvent(index).isAllDay;

  @override
  Color getColor(int index) => getEvent(index).backgroundColor;
}
