import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TypeEvent {
  TypeEvent({
    required this.label,
    required this.value,
    required this.iconChecked,
    required this.iconNonChecked,
    required this.selectedColor,
  });

  String label;
  bool value;
  Icon iconChecked;
  Icon iconNonChecked;
  Color selectedColor;

  Icon get showedIcon => (value) ? iconChecked : iconNonChecked;
}

class TypeEventProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<TypeEvent> _typeEvent = [
    TypeEvent(
      label: "Planning",
      value: true,
      iconChecked: const Icon(
        Icons.today_rounded,
        color: Colors.white,
      ),
      iconNonChecked: const Icon(
        Icons.today_outlined,
        color: Color(0xFF4C75A0),
      ),
      selectedColor: const Color(0xFF4C75A0),
    ),
    TypeEvent(
      label: "Deadline",
      value: false,
      iconChecked: const Icon(
        Icons.warning_rounded,
        color: Colors.white,
      ),
      iconNonChecked: const Icon(
        Icons.warning_amber_rounded,
        color: Color(0xFF4C75A0),
      ),
      selectedColor: const Color(0xFF4C75A0),
    )
  ];

  List<TypeEvent> get typeEvent => _typeEvent;

  String get currentActive =>
      _typeEvent.firstWhere((tE) => tE.value == true).label;

  void changeEventTypeValue(TypeEvent typeEvent) {
    for (int _ = 0; _ < _typeEvent.length; _++) {
      _typeEvent[_].value = false;
    }
    typeEvent.value = true;
    notifyListeners();
  }
}
