import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Tag {
  Tag({
    required this.label,
    required this.value,
    required this.icon,
    required this.selectedColor,
  });

  String label;
  bool value;
  Icon icon;
  Color selectedColor;

  Icon get showedIcon => (value)
      ? icon
      : const Icon(
          Icons.circle_outlined,
          color: Colors.grey,
        );
}

class DeadlineTagsProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<String> globalTagsFromAppointment = ['Perso', 'Travail', 'Urgent'];

  bool isCustomTag(String tagLabel) =>
      !globalTagsFromAppointment.contains(tagLabel);

  final List<Tag> _tags = [
    Tag(
      label: "Perso",
      value: false,
      icon: const Icon(
        Icons.person_rounded,
        color: Colors.white,
      ),
      selectedColor: Colors.amber,
    ),
    Tag(
      label: "Travail",
      value: false,
      icon: const Icon(
        Icons.school_rounded,
        color: Colors.white,
      ),
      selectedColor: const Color(0xFF6D071A),
    ),
    Tag(
      label: "Urgent",
      value: false,
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: Colors.white,
      ),
      selectedColor: Colors.red,
    )
  ];

  List<Tag> get tags => _tags;

  void changeTagValue(Tag tag) {
    tag.value = !tag.value;
    notifyListeners();
  }

  void resetAllTagValue() {
    for (int index = 0; index < _tags.length; index++) {
      _tags[index].value = false;
    }
    notifyListeners();
  }

  List<String> get activatedTags =>
      _tags.where((t) => t.value).map((t) => t.label).toList();
}
