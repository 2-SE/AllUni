import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Models/EventModel.dart';

class EventViewingPopUp extends StatelessWidget {
  final Event event;

  const EventViewingPopUp({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VIEWING"),
        leading: const CloseButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          Text(
            event.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            event.description,
          ),
          const SizedBox(height: 10),
          Text(
            "${event.fromDate}",
          ),
          Text(
            "${event.toDate}",
          ),
        ],
      ),
    );
  }
}
