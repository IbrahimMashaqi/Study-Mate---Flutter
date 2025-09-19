import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});
  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  DateTime _normalize(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  Map<DateTime, String> notes = {};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme().copyWith(
          titleLarge: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          titleTextStyle: GoogleFonts.aBeeZee(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 2, bottom: 15),
            child: Text("Calendar"),
          ),
        ),

        body: Column(
          children: [
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: _selectedDay,
              lastDay: DateTime(2100),

              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                DateTime normalizeDate = _normalize(selectedDay);
                if (notes.containsKey(normalizeDate)) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Note"),
                      content: Text(notes[normalizeDate]!),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Ok"),
                        ),
                      ],
                    ),
                  );
                } else {
                  TextEditingController controller = TextEditingController();
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Add Note"),
                      content: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: "Enter your note here:",
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              notes[normalizeDate] = controller.text;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Save"),
                        ),
                      ],
                    ),
                  );
                }
              },

              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  DateTime normalized = _normalize(date);
                  if (notes.containsKey(normalized)) {
                    return const Positioned(
                      bottom: 8,
                      child: Icon(Icons.circle, size: 8, color: Colors.red),
                    );
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
