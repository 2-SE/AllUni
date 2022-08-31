import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:navigation_drawer_test/models/Event.dart';


class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];
  List<Event> get events => _events;


  Future<void> addEvent(Event event) async {
    try {
      _events.add(event);
      notifyListeners();
      await Amplify.DataStore.save(event);
    } catch (e) {
      rethrow;
    }
  }


  Future<void> deleteEvent(Event event) async {
    try {
      _events.remove(event);
      notifyListeners();
      await Amplify.DataStore.save(event);
    } catch (e) {
      rethrow;
    }
  }


  Future<void> editEvent(Event newEvent, Event oldEvent) async {
    try {
      final index = _events.indexOf(oldEvent);
      _events[index] = newEvent;
      notifyListeners();
      newEvent = newEvent.copyWith(id: oldEvent.id);
      await Amplify.DataStore.save(newEvent);
    } catch (e) {
      rethrow;
    }
  }


  Future<void> APICreateEvent(Event event) async {
    try {
      final request = ModelMutations.create(event);
      await Amplify.API
          .mutate(request: request)
          .response;
    } on ApiException catch (e) {
      rethrow;
    }
  }

  Future<void> APIUpdateEvent(Event originalEvent, Event endEvent) async {
    try {
      final event = endEvent.copyWith(id: originalEvent.id);
      final request = ModelMutations.update(event);
      await Amplify.API
          .mutate(request: request)
          .response;
    } on ApiException catch (e) {
      rethrow;
    }
  }

  Future<void> APIdeleteEvent(Event event) async {
    try {
      final request = ModelMutations.delete(event);
      await Amplify.API
          .mutate(request: request)
          .response;
    } on ApiException catch (e) {
      rethrow;
    }
  }
}

