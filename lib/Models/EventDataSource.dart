import 'package:AllUni/Models/EventsModel.dart' show Event;
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }

  Event getEvent(int index) => appointments![index] as Event;

  String getTitle(int index) => getEvent(index).title;

  String getDescription(int index) => getEvent(index).description;

  @override
  DateTime getStartTime(int index) => getEvent(index).fromDate;

  @override
  DateTime getEndTime(int index) => getEvent(index).toDate;

  String getLocalization(int index) => getEvent(index).localization;

  List<String> getTagsNames(int index) => getEvent(index).tagsNames;
}
