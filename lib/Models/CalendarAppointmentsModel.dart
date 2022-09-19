class CalendarAppointment {
  String id;
  String appointmentType;
  String title;
  String description;
  DateTime fromDate;
  DateTime toDate;
  DateTime deadlineDate;
  String? localization;
  List<String> tagsNames;
  bool _isFixedType = false;

  CalendarAppointment({
    required this.id,
    required this.appointmentType,
    required this.title,
    required this.description,
    required this.fromDate,
    required this.toDate,
    required this.deadlineDate,
    this.localization = "",
    this.tagsNames = const [],
  });

  CalendarAppointment.emptyAppointment()
      : id = "",
        appointmentType = "Planning",
        title = "",
        description = "",
        fromDate = DateTime.now(),
        toDate = DateTime.now().add(const Duration(hours: 1)),
        deadlineDate = DateTime.now().add(const Duration(hours: 1)),
        localization = "",
        tagsNames = [],
        _isFixedType = true;

  CalendarAppointment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        appointmentType = json['appointmentType'],
        title = json['title'],
        description = json['description'],
        fromDate = json['fromDate'],
        toDate = json['toDate'],
        deadlineDate = json['deadlineDate'],
        localization = json['localization'],
        tagsNames = json['tagsNames'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'appointmentType': appointmentType,
        'title': title,
        'description': description,
        'fromDate': fromDate,
        'toDate': toDate,
        'deadlineDate': deadlineDate,
        'localization': localization,
        'tagsNames': tagsNames,
      };

  CalendarAppointment clone() => CalendarAppointment.fromJson(toJson());

  bool get isFixedType => _isFixedType;

  void save() {
    _isFixedType = false;
  }

  String toString() =>
      "ID: $id | Type: $appointmentType | Titre: $title | Description: $description | FromDate: $fromDate | ToDate: $toDate | DeadlineDate: $deadlineDate | Lieu: $localization | Tags: $tagsNames";
}
