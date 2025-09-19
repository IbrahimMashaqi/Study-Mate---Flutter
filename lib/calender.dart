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

  Map<DateTime, List<String>> notes = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme().copyWith(
          titleLarge: const TextStyle(
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
        appBar: AppBar(title: const Text("📅 My Calendar"), centerTitle: true),

        body: Column(
          children: [
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime(2020),
              lastDay: DateTime(2100),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
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

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Notes for ${_selectedDay.toLocal().toString().split(' ')[0]}",
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),

            Expanded(
              child:
                  notes[_normalize(_selectedDay)] == null ||
                      notes[_normalize(_selectedDay)]!.isEmpty
                  ? const Center(child: Text("No notes yet. Tap ➕ to add."))
                  : ListView.builder(
                      itemCount: notes[_normalize(_selectedDay)]!.length,
                      itemBuilder: (context, index) {
                        String note = notes[_normalize(_selectedDay)]![index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 12,
                          ),
                          child: ListTile(
                            title: Text(note),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    _editNoteDialog(index);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      notes[_normalize(_selectedDay)]!.removeAt(
                                        index,
                                      );
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addNoteDialog();
          },
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _addNoteDialog() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Note"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Enter your note here...",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  DateTime normalized = _normalize(_selectedDay);
                  notes.putIfAbsent(normalized, () => []);
                  notes[normalized]!.add(controller.text);
                });
              }
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _editNoteDialog(int index) {
    DateTime normalized = _normalize(_selectedDay);
    TextEditingController controller = TextEditingController(
      text: notes[normalized]![index],
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Note"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Edit your note..."),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  notes[normalized]![index] = controller.text;
                });
              }
              Navigator.pop(context);
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }
}
