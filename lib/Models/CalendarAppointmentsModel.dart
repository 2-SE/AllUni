// class CalendarAppointment {
//   final String appointmentType;
//   final String title;
//   final String description;
//   final DateTime fromDate;
//   final DateTime toDate;
//   final DateTime deadlineDate;
//   final String localization;
//   final List<String> tagsNames;
//
//   CalendarAppointment({
//     required this.appointmentType,
//     required this.title,
//     this.description = "",
//     required this.fromDate,
//     required this.toDate,
//     required this.deadlineDate,
//     this.localization = "",
//     this.tagsNames = const [],
//   });
//
//   // CalendarAppointment cloneAppointmentData() => CalendarAppointment();
//   // Map cloneAppointmentData = Map.from(CalendarAppointment);
//
//   @override
//   String toString() =>
//       '$appointmentType | $title | $description | $fromDate | $toDate | $deadlineDate | $localization | $tagsNames';
// }

class CalendarAppointment {
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
      : appointmentType = "Planning",
        title = "",
        description = "",
        fromDate = DateTime.now(),
        toDate = DateTime.now().add(const Duration(hours: 1)),
        deadlineDate = DateTime.now().add(const Duration(hours: 1)),
        localization = "",
        tagsNames = [],
        _isFixedType = true;

  CalendarAppointment.fromJson(Map<String, dynamic> json)
      : appointmentType = json['appointmentType'],
        title = json['title'],
        description = json['description'],
        fromDate = json['fromDate'],
        toDate = json['toDate'],
        deadlineDate = json['deadlineDate'],
        localization = json['localization'],
        tagsNames = json['tagsNames'];

  Map<String, dynamic> toJson() => {
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
      "Type: $appointmentType | Titre: $title | Description: $description | FromDate: $fromDate | ToDate: $toDate | DeadlineDate: $deadlineDate | Lieu: $localization | Tags: $tagsNames";
}
