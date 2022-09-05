import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarAppointmentsDataSource extends CalendarDataSource {
  CalendarAppointmentsDataSource(List<CalendarAppointment> appointments) {
    this.appointments = appointments;
  }

  CalendarAppointment getAppointment(int index) =>
      appointments![index] as CalendarAppointment;

  String getAppointmentType(
    int index,
  ) =>
      getAppointment(index).appointmentType;

  String getAppointmentTitle(
    int index,
  ) =>
      getAppointment(index).title;

  String getAppointmentDescription(
    int index,
  ) =>
      getAppointment(index).description;

  DateTime getAppointmentFromDate(
    int index,
  ) =>
      getAppointment(index).fromDate;

  DateTime getAppointmentToDate(
    int index,
  ) =>
      getAppointment(index).toDate;

  DateTime getAppointmentDeadlineDate(
    int index,
  ) =>
      getAppointment(index).deadlineDate;

  String getAppointmentLocalization(
    int index,
  ) =>
      getAppointment(index).localization;

  List<String> getAppointmentTags(
    int index,
  ) =>
      getAppointment(index).tagsNames;
}
