class CalendarAppointment {
  final String appointmentType;
  final String title;
  final String description;
  final DateTime fromDate;
  final DateTime toDate;
  final DateTime deadlineDate;
  final String localization;
  final List<String> tagsNames;

  CalendarAppointment({
    required this.appointmentType,
    required this.title,
    this.description = "",
    required this.fromDate,
    required this.toDate,
    required this.deadlineDate,
    this.localization = "",
    this.tagsNames = const [],
  });

  @override
  String toString() => '$title $appointmentType';
}
