class Deadline {
  final String title;
  final String description;
  final DateTime deadlineDate;
  final List<String> tagsNames;

  const Deadline({
    required this.title,
    this.description = "",
    required this.deadlineDate,
    this.tagsNames = const [],
  });
}
