//IT'S WILL BE FOR LATER FOR NOW (WAITING FOR DYNAMODB FOR THAT)
/*
import 'package:AllUni/Drawers/DrawerCalendarView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class FreeRoomsCalendar extends StatefulWidget {
  final int CalendarFormatIndex;

  FreeRoomsCalendar({
    Key? key,
    required this.CalendarFormatIndex,
  }) : super(key: key);

  @override
  State<FreeRoomsCalendar> createState() =>
      _FreeRoomsCalendarState(CalendarFormatIndex);
}

class _FreeRoomsCalendarState extends State<FreeRoomsCalendar> {
  List<bool> CalendarFormat = [false, false, false, false];
  int CalendarFormatIndex;
  _FreeRoomsCalendarState(this.CalendarFormatIndex);

  @override
  Widget build(BuildContext context) {
    CalendarFormat[widget.CalendarFormatIndex] = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Salles Libres'),
        backgroundColor: const Color(0xFF4C75A0),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.calendar_today),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => FreeRoomsCalendar(
                            CalendarFormatIndex: CalendarFormatIndex)))
                    .then((_) {
                  setState(() {});
                });
              },
            ),
          ),
        ],
      ),
      drawer: DrawerCalendarView(
        currentView: "FreeRooms",
        isSelectedFormat: CalendarFormat,
      ),
      //BODY PART
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: SfCalendar(
                view: CalendarView.month,
                todayHighlightColor: const Color(0xFF4C75A0),
                todayTextStyle: const TextStyle(color: Colors.white),
                firstDayOfWeek: 1,
                cellBorderColor: Colors.grey.withOpacity(0.25),
                initialSelectedDate: DateTime.now(),
                monthViewSettings: const MonthViewSettings(
                  numberOfWeeksInView: 1,
                  navigationDirection: MonthNavigationDirection.horizontal,
                  appointmentDisplayCount: 0,
                  dayFormat: 'EEE',
                  showTrailingAndLeadingDates: false,
                ),
                onTap: (details) {},
              ),
            ),
            const Divider(
              height: 8,
              color: Colors.grey,
            ),
            /*
            FutureBuilder(builder: (context, snap) {
              return ListView.builder(
                itemCount: freeroomsList.length,
                itemBuilder: (context, index) => Card(
                  elevation: 6,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(freeroomsList[index]["title"]),
                    subtitle: Text(freeroomsList[index]["subtitle"]),
                    dense: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.15,
                      ),
                    ),
                  ),
                ),
              );
            }),
            */
          ],
        ),
      ),
    );
  }
}
 */
