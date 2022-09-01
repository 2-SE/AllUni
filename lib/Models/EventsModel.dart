class Event {
  final String title;
  final String description;
  final DateTime fromDate;
  final DateTime toDate;
  final String localization;
  final List<String> tagsNames;

  const Event({
    required this.title,
    this.description = "",
    required this.fromDate,
    required this.toDate,
    this.localization = "",
    this.tagsNames = const [],
  });
}
