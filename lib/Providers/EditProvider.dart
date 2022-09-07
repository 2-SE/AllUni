import 'package:flutter/foundation.dart';

class EditPlanning {
  EditPlanning({
    required this.title,
    required this.description,
    required this.fromDate,
    required this.toDate,
    required this.deadlineDate,
    required this.localization,
    required this.tags,
  });

  String title;
  String description;
  late DateTime fromDate;
  late DateTime toDate;
  late DateTime deadlineDate;
  String localization;
  List<String> tags;
}

class EditPlanningProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<EditPlanning> _editPlanning = [
    EditPlanning(
      title: "",
      description: "",
      fromDate: DateTime.now(),
      toDate: DateTime.now().add(const Duration(hours: 1)),
      deadlineDate: DateTime.now(),
      localization: "",
      tags: [],
    )
  ];

  List<EditPlanning> get editPlanning => _editPlanning;

  void changePlanningTitle(String title) {
    _editPlanning[0].title = title;
  }

  void changePlanningDescription(String description) {
    _editPlanning[0].description = description;
  }

  void changePlanningFromDate(DateTime fromDate) {
    _editPlanning[0].fromDate = fromDate;
  }

  getPlanningFromDate() {
    return _editPlanning[0].fromDate;
  }

  void changePlanningToDate(DateTime toDate) {
    _editPlanning[0].toDate = toDate;
  }

  getPlanningToDate() {
    return _editPlanning[0].toDate;
  }

  void changePlanningLocalization(String localization) {
    _editPlanning[0].localization = localization;
  }

  getPlanningLocalization() {
    return _editPlanning[0].localization;
  }

  void changePlanningTags(List<String> tags) {
    _editPlanning[0].tags = tags;
  }

  getPlanningTags() {
    return _editPlanning[0].tags;
  }

  void resetAllPlanningValues() {
    _editPlanning[0].title = "";
    _editPlanning[0].description = "";
    _editPlanning[0].fromDate = DateTime.now();
    _editPlanning[0].toDate = DateTime.now().add(const Duration(hours: 1));
    _editPlanning[0].localization = "";
    _editPlanning[0].tags = [];
  }

  void resetParametersPlanningValues() {
    _editPlanning[0].fromDate = DateTime.now();
    _editPlanning[0].toDate = DateTime.now().add(const Duration(hours: 1));
    _editPlanning[0].localization = "";
    _editPlanning[0].tags = [];
  }
}

class EditDeadline {
  EditDeadline({
    required this.title,
    required this.description,
    required this.deadlineDate,
    required this.tags,
  });

  String title;
  String description;
  late DateTime deadlineDate;
  List<String> tags;
}

class EditDeadlineProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<EditDeadline> _editDeadline = [
    EditDeadline(
      title: "",
      description: "",
      deadlineDate: DateTime.now(),
      tags: [],
    )
  ];

  List<EditDeadline> get editDeadline => _editDeadline;

  void changeDeadlineTitle(String title) {
    _editDeadline[0].title = title;
  }

  void changeDeadlineDescription(String description) {
    _editDeadline[0].description = description;
  }

  void changeDeadlineToDate(DateTime deadlineDate) {
    _editDeadline[0].deadlineDate = deadlineDate;
  }

  getDeadlineToDate() {
    return _editDeadline[0].deadlineDate;
  }

  void changeDeadlineTags(List<String> tags) {
    _editDeadline[0].tags = tags;
  }

  getDeadlineTags() {
    return _editDeadline[0].tags;
  }

  void resetAllDeadlineValues() {
    _editDeadline[0].title = "";
    _editDeadline[0].description = "";
    _editDeadline[0].deadlineDate = DateTime.now();
    _editDeadline[0].tags = [];
  }

  void resetParametersDeadlineValues() {
    _editDeadline[0].deadlineDate = DateTime.now();
    _editDeadline[0].tags = [];
  }
}
