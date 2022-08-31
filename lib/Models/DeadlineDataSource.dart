import 'package:AllUni/Models/EventsModel.dart' show Deadline;
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DeadlineDataSource extends CalendarDataSource {
  DeadlineDataSource(List<Deadline> appointments) {
    this.appointments = appointments;
  }

  Deadline getDeadline(int index) => appointments![index] as Deadline;

  String getTitle(int index) => getDeadline(index).title;

  String getDescription(int index) => getDeadline(index).description;

  DateTime getDeadlineTime(int index) => getDeadline(index).deadlineDate;

  String getLocalization(int index) => getDeadline(index).localization;

  List<String> getTags(int index) => getDeadline(index).tagsNames;
}
