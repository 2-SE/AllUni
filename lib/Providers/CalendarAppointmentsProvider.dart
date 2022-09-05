import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:flutter/cupertino.dart';

class CalendarAppointmentsProvider extends ChangeNotifier {
  final List<CalendarAppointment> _appointments = [];

  List<CalendarAppointment> get appointments => _appointments;

  void addAppointment(CalendarAppointment appointments) {
    _appointments.add(appointments);
    notifyListeners();
  }

  void deleteAppointment(CalendarAppointment appointments) {
    _appointments.remove(appointments);
    notifyListeners();
  }

  void editAppointment(
    CalendarAppointment newAppointment,
    CalendarAppointment oldAppointment,
  ) {
    final index = _appointments.indexOf(oldAppointment);
    _appointments[index] = newAppointment;
    notifyListeners();
  }
}
