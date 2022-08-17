import 'package:flutter/material.dart';


class Event {
  final String title;
  final String description;
  final DateTime fromDate;
  final DateTime toDate;
  final Color backgroundColor;
  final bool isAllDay;

  const Event({
    required this.title,
    this.description = "",
    required this.fromDate,
    required this.toDate,
    this.backgroundColor = Colors.green,
    this.isAllDay = false,
  });
}