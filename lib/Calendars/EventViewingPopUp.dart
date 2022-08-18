import 'package:flutter/material.dart';
import 'package:navigation_drawer_test/Calendars/EventEditingPage.dart';
import 'package:navigation_drawer_test/Models/EventModel.dart';
import 'package:navigation_drawer_test/Providers/EventProvider.dart';
import 'package:provider/provider.dart';

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
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EventEditingPage(event: event)));
            },
            child: const Text("Editer"),
          ),
          TextButton(
            onPressed: () {
              final provider =
                  Provider.of<EventProvider>(context, listen: false);
              provider.deleteEvent(event);
              Navigator.of(context).pop();
            },
            child: const Text("Supprimer"),
          ),
        ],
      ),
    );
  }
}
