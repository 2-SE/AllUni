import 'package:flutter/cupertino.dart';
import 'package:navigation_drawer_test/Models/EventsModel.dart';

class EventProvider extends ChangeNotifier {
  final List<PersonalEvent> _events = [];

  List<PersonalEvent> get events => _events;

  void addEvent(PersonalEvent event) {
    _events.add(event);
    notifyListeners();
  }

  void deleteEvent(PersonalEvent event) {
    _events.remove(event);
    notifyListeners();
  }

  void editEvent(PersonalEvent newEvent, PersonalEvent oldEvent) {
    final index = _events.indexOf(oldEvent);
    _events[index] = newEvent;
    notifyListeners();
  }
}
