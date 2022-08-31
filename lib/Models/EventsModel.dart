class Event {
  final String title;
  final String description;
  final DateTime fromDate;
  final DateTime toDate;
  final String localization;
  final List<String> tagsNames;
  final String customTagName;

  const Event({
    required this.title,
    this.description = "",
    required this.fromDate,
    required this.toDate,
    this.localization = "",
    this.tagsNames = const [],
    this.customTagName = "",
  });
}

class Deadline {
  final String title;
  final String description;
  final DateTime deadlineDate;
  final String localization;
  final List<String> tagsNames;
  final String customTagName;

  const Deadline({
    required this.title,
    this.description = "",
    required this.deadlineDate,
    this.localization = "",
    this.tagsNames = const [],
    this.customTagName = "",
  });
}
