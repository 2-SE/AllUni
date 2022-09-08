import 'package:flutter/foundation.dart';

class EditPlanning {
  EditPlanning({
    required this.title,
    required this.description,
    required this.fromDate,
    required this.toDate,
    required this.localization,
    required this.tags,
  });

  String title;
  String description;
  DateTime fromDate;
  DateTime toDate;
  String localization;
  List<String> tags;
}

class EditPlanningProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late final List<EditPlanning> _editPlanning = [
    EditPlanning(
      title: "",
      description: "",
      fromDate: DateTime.now(),
      toDate: DateTime.now().add(const Duration(hours: 1)),
      localization: "",
      tags: [],
    ),
  ];

  List<EditPlanning> get editPlanning => _editPlanning;

  void changePlanningTitle(String title) {
    _editPlanning[0].title = title;
    notifyListeners();
  }

  void changePlanningDescription(String description) {
    _editPlanning[0].description = description;
    notifyListeners();
  }

  void changePlanningFromDate(DateTime fromDate) {
    _editPlanning[0].fromDate = fromDate;
    notifyListeners();
  }

  void changePlanningToDate(DateTime toDate) {
    _editPlanning[0].toDate = toDate;
    notifyListeners();
  }

  void changePlanningLocalization(String localization) {
    _editPlanning[0].localization = localization;
    notifyListeners();
  }

  void changePlanningTags(List<String> tags) {
    _editPlanning[0].tags = tags;
    notifyListeners();
  }

  DateTime get getPlanningFromDate => _editPlanning[0].fromDate;
  DateTime get getPlanningToDate => _editPlanning[0].toDate;
  String get getPlanningLocalization => _editPlanning[0].localization;
  List<String> get getPlanningTagsList => _editPlanning[0].tags;

  void resetAllPlanningValues() {
    _editPlanning[0].title = "";
    _editPlanning[0].description = "";
    _editPlanning[0].fromDate = DateTime.now();
    _editPlanning[0].toDate = DateTime.now().add(const Duration(hours: 1));
    _editPlanning[0].localization = "";
    _editPlanning[0].tags = [];
    notifyListeners();
  }

  void resetParametersPlanningValues() {
    _editPlanning[0].fromDate = DateTime.now();
    _editPlanning[0].toDate = DateTime.now().add(const Duration(hours: 1));
    _editPlanning[0].localization = "";
    _editPlanning[0].tags = [];
    notifyListeners();
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
  late final List<EditDeadline> _editDeadline = [
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
    notifyListeners();
  }

  void changeDeadlineDescription(String description) {
    _editDeadline[0].description = description;
    notifyListeners();
  }

  void changeDeadlineToDate(DateTime deadlineDate) {
    _editDeadline[0].deadlineDate = deadlineDate;
    notifyListeners();
  }

  void changeDeadlineTags(List<String> tags) {
    _editDeadline[0].tags = tags;
    notifyListeners();
  }

  DateTime get getDeadlineToDate => _editDeadline[0].deadlineDate;
  List<String> get getDeadlineTagsList => _editDeadline[0].tags;

  void resetAllDeadlineValues() {
    _editDeadline[0].title = "";
    _editDeadline[0].description = "";
    _editDeadline[0].deadlineDate = DateTime.now();
    _editDeadline[0].tags = [];
    notifyListeners();
  }

  void resetParametersDeadlineValues() {
    _editDeadline[0].deadlineDate = DateTime.now();
    _editDeadline[0].tags = [];
    notifyListeners();
  }
}
