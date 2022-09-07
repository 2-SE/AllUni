import 'package:AllUni/Calendars/Editing/EventEditingPage.dart';
import 'package:AllUni/Calendars/Viewing/EventViewingPopUp.dart';
import 'package:AllUni/Drawers/DrawerCalendarView.dart';
import 'package:AllUni/Models/CalendarAppointmentsDataSource.dart';
import 'package:AllUni/Providers/CalendarAppointmentsProvider.dart';
import 'package:AllUni/Utils/DateHourUtils.dart';
import 'package:AllUni/Utils/HeroDialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  String currentView;
  int CalendarFormatIndex;

  Calendar(this.currentView, this.CalendarFormatIndex, {Key? key})
      : super(key: key);

  @override
  State<Calendar> createState() =>
      _CalendarState(currentView, CalendarFormatIndex);
}

class _CalendarState extends State<Calendar> {
  List<bool> CalendarFormat = [false, false, false, false];
  String CalendarFormatString = "";

  String currentView;
  int CalendarFormatIndex;
  _CalendarState(this.currentView, this.CalendarFormatIndex);

  final CalendarController _controller = CalendarController();

  Widget calendarAppointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
  ) {
    final appointment = details.appointments.first;

    if (CalendarFormatIndex == 0 || CalendarFormatIndex == 3) {
      // CALENDAR.VIEW = FEED & MONTH-LIST
      return Container(
        width: details.bounds.width,
        height: details.bounds.height,
        decoration: BoxDecoration(
          color: (appointment.appointmentType == "Planning")
              ? const Color(0xFFEFE0C0) //0xFFEFE0C0//0xFFF2D492
              : (appointment.appointmentType == "Deadline")
                  ? const Color(0xFFA90404) //0xFFB4460D//0xFFA90404//0xFF982F09
                  : const Color(0xFFBCCCDD),
          borderRadius: BorderRadius.circular(details.bounds.height * 0.2),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 1,
              child: (appointment.appointmentType == "Planning")
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${DateFormat.Hm().format(appointment.fromDate)}   ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: details.bounds.height * 0.25,
                            fontWeight: FontWeight.w300,
                            color: (appointment.appointmentType == "Planning")
                                ? Colors.black
                                : (appointment.appointmentType == "Deadline")
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                        Text(
                          "${DateFormat.Hm().format(appointment.toDate)}   ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: details.bounds.height * 0.25,
                            fontWeight: FontWeight.w300,
                            color: (appointment.appointmentType == "Planning")
                                ? Colors.black
                                : (appointment.appointmentType == "Deadline")
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      "${DateFormat.Hm().format(appointment.deadlineDate)}   ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: details.bounds.height * 0.25,
                        fontWeight: FontWeight.w300,
                        color: (appointment.appointmentType == "Planning")
                            ? Colors.black
                            : (appointment.appointmentType == "Deadline")
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
            ),
            Container(
              color: (appointment.appointmentType == "Planning")
                  ? Colors.black
                  : (appointment.appointmentType == "Deadline")
                      ? Colors.white
                      : Colors.black,
              height: details.bounds.height * 0.85,
              width: 1.5,
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              flex: 7,
              child: (appointment.description.isNotEmpty)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${appointment.title}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: details.bounds.height * 0.3,
                            fontWeight: (appointment.appointmentType ==
                                    "Planning")
                                ? FontWeight.w500
                                : (appointment.appointmentType == "Deadline")
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                            color: (appointment.appointmentType == "Planning")
                                ? Colors.black
                                : (appointment.appointmentType == "Deadline")
                                    ? Colors.white
                                    : Colors.black,
                            //color: Colors.black,
                          ),
                        ),
                        Text(
                          "${appointment.description}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: details.bounds.height * 0.2,
                            color: (appointment.appointmentType == "Planning")
                                ? Colors.black
                                : (appointment.appointmentType == "Deadline")
                                    ? Colors.white
                                    : Colors.black,
                            //color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      "${appointment.title}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: details.bounds.height * 0.3,
                        fontWeight: (appointment.appointmentType == "Planning")
                            ? FontWeight.w500
                            : (appointment.appointmentType == "Deadline")
                                ? FontWeight.bold
                                : FontWeight.w500,
                        color: (appointment.appointmentType == "Planning")
                            ? Colors.black
                            : (appointment.appointmentType == "Deadline")
                                ? Colors.white
                                : Colors.black,
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
        decoration: BoxDecoration(
          color: (appointment.appointmentType == "Planning")
              ? const Color(0xFFEFE0C0) //0xFFEFE0C0//0xFFF2D492
              : (appointment.appointmentType == "Deadline")
                  ? const Color(0xFFA90404) //0xFFB4460D//0xFFA90404//0xFF982F09
                  : const Color(0xFFBCCCDD),
          borderRadius: BorderRadius.circular(details.bounds.height * 0.1),
        ),
        child: (appointment.appointmentType == "Planning" &&
                DateHourUtils.toDate(appointment.fromDate) ==
                    DateHourUtils.toDate(appointment.toDate))
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${appointment.title}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    // A CHANGER POUR VOIR JUSTE DES BULLES DE LA COULEURS DES TAGS
                    "${appointment.tagsNames}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            : (appointment.appointmentType == "Planning" &&
                    DateHourUtils.toDate(appointment.fromDate) !=
                        DateHourUtils.toDate(appointment.toDate))
                ? Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${appointment.title}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateHourUtils.toTime(appointment.fromDate),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  DateHourUtils.toTime(appointment.toDate),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        flex: (appointment.tagsNames.isNotEmpty ||
                                appointment.tagsNames.length == 0 ||
                                appointment.description.isNotEmpty)
                            ? 1
                            : 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (appointment.tagsNames.isNotEmpty ||
                                    appointment.tagsNames.length == 0)
                                ? const Icon(Icons
                                    .tag_rounded) // METTRE L'AFFICHAGE DES BULLES DES TAGS
                                : const Icon(Icons.add),
                            (appointment.description.isNotEmpty)
                                ? const Icon(Icons.notes_rounded)
                                : const Icon(Icons.note_add_rounded)
                          ],
                        ),
                      ),
                    ],
                  )
                : (appointment.appointmentType == "Deadline")
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            child: Text(
                              "${appointment.title}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              DateHourUtils.toTime(appointment.deadlineDate),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${appointment.title}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "${appointment.localization}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                // Text(
                                //   "${appointment.professeur}",
                                //   overflow: TextOverflow.ellipsis,
                                //   style: const TextStyle(
                                //     fontSize: 10,
                                //   ),
                                // ),
                                Text(
                                  "${DateFormat.Hm().format(appointment.fromDate)} - ${DateFormat.Hm().format(appointment.toDate)}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: (appointment.tagsNames.isNotEmpty ||
                                    appointment.tagsNames.length == 0 ||
                                    appointment.description.isNotEmpty)
                                ? 1
                                : 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (appointment.tagsNames.isNotEmpty ||
                                        appointment.tagsNames.length == 0)
                                    ? const Icon(Icons
                                        .tag_rounded) // METTRE L'AFFICHAGE DES BULLES DES TAGS
                                    : const Icon(Icons.add),
                                (appointment.description.isNotEmpty)
                                    ? const Icon(Icons.notes_rounded)
                                    : const Icon(Icons.note_add_rounded)
                              ],
                            ),
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
          color: (appointment.appointmentType == "Planning")
              ? const Color(0xFFEFE0C0) //0xFFEFE0C0//0xFFF2D492
              : (appointment.appointmentType == "Deadline")
                  ? const Color(0xFFA90404) //0xFFB4460D//0xFFA90404//0xFF982F09
                  : const Color(0xFFBCCCDD),
          borderRadius: BorderRadius.circular(details.bounds.height * 0.1),
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

    final appointments =
        Provider.of<CalendarAppointmentsProvider>(context).appointments;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentView),
        backgroundColor: const Color(0xFF4C75A0),
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      drawer: DrawerCalendarView(
        currentView: widget.currentView,
        isSelectedFormat: CalendarFormat,
      ),
      body: SfCalendar(
        controller: _controller, // Change the Calendar Type View
        todayHighlightColor: const Color(0xFF4C75A0),
        todayTextStyle: const TextStyle(color: Colors.white),
        appointmentBuilder: calendarAppointmentBuilder,
        dataSource: CalendarAppointmentsDataSource(appointments),
        showDatePickerButton: true,
        firstDayOfWeek: 1,
        cellBorderColor: Colors.grey.withOpacity(0.25),
        initialSelectedDate: DateTime.now(),
        initialDisplayDate: DateTime.now().add(const Duration(hours: -2)),
        timeSlotViewSettings: const TimeSlotViewSettings(
          timeFormat: 'HH:mm',
          timeIntervalHeight: 70,
          /*
          //LATER MAYBE FOR -8h-20h format
          timeIntervalHeight: -1,
          startHour: 7,
          endHour: 20,
           */
        ),
        scheduleViewSettings: const ScheduleViewSettings(
          hideEmptyScheduleWeek: false,
          dayHeaderSettings: DayHeaderSettings(
            dayFormat: 'EEE',
            width: 50,
            dayTextStyle: TextStyle(
              fontSize: 10,
              color: Color(0xFF061323),
            ),
            dateTextStyle: TextStyle(
              fontSize: 20,
              color: Color(0xFF061323),
            ),
          ),
          weekHeaderSettings: WeekHeaderSettings(
            startDateFormat: "dd MMMM",
            endDateFormat: "dd MMMM",
          ),
          monthHeaderSettings: MonthHeaderSettings(
            height: 75,
            backgroundColor: Color(0xFF061323),
            textAlign: TextAlign.center,
          ),
        ),
        monthViewSettings: MonthViewSettings(
          navigationDirection: MonthNavigationDirection.horizontal,
          appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
          //appointmentDisplayCount: 4,
          dayFormat: 'EEE',
          showTrailingAndLeadingDates: false,
          showAgenda: true,
          agendaViewHeight: MediaQuery.of(context).size.height * 0.35,
        ),
        onTap: (details) {
          if (details.appointments == null) return;
          final calendarAppointment = details.appointments!.first;
          if (details.targetElement != CalendarElement.calendarCell) {
            Navigator.of(context).push(
              HeroDialogRoute(
                builder: (context) => Center(
                  child: EventViewingPopUp(
                    calendarAppointment: calendarAppointment,
                  ),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: Visibility(
        visible: (currentView == "Mon Calendrier") ? true : false,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF4C75A0),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const EventEditingPage(),
              ),
            );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
