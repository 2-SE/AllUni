import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:navigation_drawer_test/Calendars/EventViewingPopUp.dart';
import 'package:navigation_drawer_test/Drawers/DrawerCalendarView.dart';
import 'package:navigation_drawer_test/Utils/Calendar/LessonAdapter.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../Utils/HeroDialog.dart';
import '../models/Lesson.dart';

class Calendar extends StatefulWidget {
  String currentView;
  int CalendarFormatIndex;
  List<Lesson> lessons;

  Calendar(this.currentView, this.CalendarFormatIndex, this.lessons);


  @override
  State<Calendar> createState() => _CalendarState(currentView, CalendarFormatIndex, lessons);
}

class _CalendarState extends State<Calendar> {
  List<bool> CalendarFormat = [false, false, false, false];
  String CalendarFormatString = "";
  List<Lesson> lessons;


  String currentView;
  int CalendarFormatIndex;
  _CalendarState(this.currentView, this.CalendarFormatIndex, this.lessons);

  final CalendarController _controller = CalendarController();

  @override
  void initState() {
    super.initState();
  }
  Widget appointmentBuilder(BuildContext context,CalendarAppointmentDetails details) {
    final lesson = details.appointments.first;

    if (CalendarFormatIndex == 0 || CalendarFormatIndex == 3) {
      // CALENDAR.VIEW = PLANNING/LIST
      return Container(
        width: details.bounds.width,
        height: details.bounds.height,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(details.bounds.height * 0.2),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "   ${DateFormat.Hm().format(lesson.HeureDebut)}   ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: details.bounds.height * 0.25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "   ${DateFormat.Hm().format(lesson.HeureFin)}   ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: details.bounds.height * 0.25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              height: details.bounds.height * 0.85,
              width: 1,
            ),
            Flexible(
              flex: 5,
              child: Text(
                "  ${lesson.NomCours}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: details.bounds.height * 0.3,
                  fontWeight: FontWeight.w600,
                  //color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (CalendarFormatIndex == 1) {
      // CALENDAR.VIEW = DAY
      return Container(
        width: details.bounds.width,
        height: details.bounds.height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(details.bounds.height * 0.2)),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(color: Colors.transparent),
            ),
            Flexible(
              flex: 35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${lesson.NomCours}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Lieu :  ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const Text(
                    "Professeur :  ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text("${DateFormat.Hm().format(lesson.HeureDebut)} - ${DateFormat.Hm().format(lesson.HeureFin)}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(color: Colors.transparent),
            ),
          ],
        ),
      );
    } else if (CalendarFormatIndex == 2) {
      // CALENDAR.VIEW = WEEK
      return Container(
        width: details.bounds.width,
        height: details.bounds.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(details.bounds.height * 0.2),
        ),
      );
    } else {
      return SizedBox(
        width: details.bounds.width,
        height: details.bounds.height,
        child: const Text("Error"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    CalendarFormat[widget.CalendarFormatIndex] = true;
    for (int index = 0; index < CalendarFormat.length; index++) {
      if (index == 0 && CalendarFormat[index] == true) {
        CalendarFormatString = "Planning";
        _controller.view = CalendarView.schedule;
      } else if (index == 1 && CalendarFormat[index] == true) {
        CalendarFormatString = "1 Jour";
        _controller.view = CalendarView.day;
      } else if (index == 2 && CalendarFormat[index] == true) {
        CalendarFormatString = "1 Semaine";
        _controller.view = CalendarView.week;
      } else if (index == 3 && CalendarFormat[index] == true) {
        CalendarFormatString = "1 Mois";
        _controller.view = CalendarView.month;
      }
    }

        return Scaffold(
            appBar: AppBar (
            title: Text(widget.currentView),
        backgroundColor: const Color(0xFF4C75A0),
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
            child: const Icon(Icons.calendar_today),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Calendar(widget.currentView, widget.CalendarFormatIndex, widget.lessons)))
                .then((_) {
                  setState(() {});
                  });
                },
              ),
            ),
          ],
        ),
        drawer: DrawerCalendarView(
        currentView: widget.currentView,
        isSelectedFormat: CalendarFormat,
        ),
        body:  SfCalendar(
              controller: _controller,
              todayHighlightColor: const Color(0xFF4C75A0),
              todayTextStyle: const TextStyle(color: Colors.white),
              appointmentBuilder: appointmentBuilder,
              dataSource: EventDataSource(lessons),
              firstDayOfWeek: 1,
              cellBorderColor: Colors.grey.withOpacity(0.25),
              initialDisplayDate: DateTime.utc(DateTime.now().year, 3, 0),
              timeSlotViewSettings: const TimeSlotViewSettings(timeFormat: 'HH:mm',timeIntervalHeight: 70,),
              scheduleViewSettings: const ScheduleViewSettings(
                hideEmptyScheduleWeek: false,
                dayHeaderSettings: DayHeaderSettings(
                  dayFormat: 'EEE',
                  width: 50,
                  dayTextStyle: TextStyle(fontSize: 10,color: Color(0xFF061323)),
                  dateTextStyle: TextStyle(fontSize: 20,color: Color(0xFF061323)),),
                weekHeaderSettings: WeekHeaderSettings(startDateFormat: "dd MMMM", endDateFormat: "dd MMMM",),
                monthHeaderSettings: MonthHeaderSettings(
                  height: 75,
                  backgroundColor: Color(0xFF061323),
                  textAlign: TextAlign.center),
              ),
              monthViewSettings: MonthViewSettings(
                navigationDirection: MonthNavigationDirection.horizontal,
                //appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                appointmentDisplayCount: 4,
                dayFormat: 'EEE',
                showTrailingAndLeadingDates: false,
                showAgenda: true,
                agendaViewHeight: MediaQuery.of(context).size.height * 0.35,
              ),
              onTap: (details) {
                if (details.appointments == null) return;
                final lesson = details.appointments!.first;
                Navigator.of(context).push(
                  HeroDialogRoute(
                    builder: (context) => Center(
                      child:LessonViewingPopUp(lesson: lesson),
                    ),
                  ),
                );
                },
            )
        );
  }
}
