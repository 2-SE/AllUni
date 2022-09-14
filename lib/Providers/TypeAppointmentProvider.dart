import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TypeAppointment {
  TypeAppointment({
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
  Icon get existingBlocShowedIcon => (value) ? iconNonChecked : iconChecked;
}

class TypeAppointmentProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<TypeAppointment> _typeAppointment = [
    TypeAppointment(
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
    TypeAppointment(
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

  List<TypeAppointment> get typeAppointment => _typeAppointment;

  String get currentActive => _typeAppointment
      .firstWhere((typeAppointment) => typeAppointment.value == true)
      .label;

  void changeEventTypeValue(TypeAppointment typeAppointment) {
    for (int index = 0; index < _typeAppointment.length; index++) {
      _typeAppointment[index].value = false;
    }
    typeAppointment.value = true;
    notifyListeners();
  }

  void refreshEventTypeValue() {
    for (int index = 0; index < _typeAppointment.length; index++) {
      _typeAppointment[index].value = false;
    }
    _typeAppointment[0].value = true;
    notifyListeners();
  }
}
