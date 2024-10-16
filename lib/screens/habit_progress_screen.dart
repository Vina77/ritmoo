import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/habit.dart';
import 'package:intl/intl.dart'; // For date formatting

class HabitProgressScreen extends StatefulWidget {
  final Habit habit;

  HabitProgressScreen({required this.habit});

  @override
  _HabitProgressScreenState createState() => _HabitProgressScreenState();
}

class _HabitProgressScreenState extends State<HabitProgressScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  
  // Example data for days when the habit was practiced
  final List<DateTime> practicedDays = [
    DateTime.utc(2023, 10, 2),
    DateTime.utc(2023, 10, 5),
    DateTime.utc(2023, 10, 7),
  ];

  bool _isHabitPracticedOn(DateTime day) {
    return practicedDays.any((practicedDay) =>
        practicedDay.year == day.year &&
        practicedDay.month == day.month &&
        practicedDay.day == day.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.habit.name} Progress'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Tracking progress for: ${widget.habit.name}\nProgress: ${widget.habit.progress}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: TableCalendar(
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update the focused day as well
                });
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  // Highlight the practiced days
                  if (_isHabitPracticedOn(day)) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.teal, // Highlight color for practiced days
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${day.day}',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}