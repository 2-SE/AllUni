import 'package:flutter/material.dart';

class PersonalEvent {
  final String title;
  final String description;
  final DateTime fromDate;
  final DateTime toDate;
  final String tag;
  final Color backgroundColor;
  final bool isAllDay;

  const PersonalEvent({
    required this.title,
    this.description = "",
    required this.fromDate,
    required this.toDate,
    this.tag = "",
    this.backgroundColor = Colors.green,
    this.isAllDay = false,
  });
}

class DeadlineTask {
  final String title;
  final String description;
  final DateTime taskDate;

  const DeadlineTask({
    required this.title,
    this.description = "",
    required this.taskDate,
  });
}

class LessonsEvent {
  final String campusID;
  final String majeureID;
  final String coursID;
  final String nomCours;
  final String professeur;
  final String lieuCours;
  final String typeBlock;
  final DateTime fromDate;
  final DateTime toDate;

  const LessonsEvent({
    required this.campusID,
    required this.majeureID,
    required this.coursID,
    required this.nomCours,
    required this.professeur,
    required this.lieuCours,
    required this.typeBlock,
    required this.fromDate,
    required this.toDate,
  });
}
