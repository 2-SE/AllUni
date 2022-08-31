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

class TagsProvider with ChangeNotifier, DiagnosticableTreeMixin {
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
      label: "Événement",
      value: false,
      icon: const Icon(
        Icons.auto_awesome,
        color: Colors.white,
      ),
      selectedColor: Colors.green,
    )
  ];

  List<Tag> get tags => _tags;

  void changeTagValue(Tag tag) {
    tag.value = !tag.value;
    notifyListeners();
  }

  void addCustomTagValue(Tag tag) {
    tags.add(tag);
    notifyListeners();
  }

  void removeCustomTagValue(Tag tag) {
    tags.remove(tag);
    notifyListeners();
  }
}
