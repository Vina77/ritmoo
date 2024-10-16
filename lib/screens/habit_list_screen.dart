import 'package:flutter/material.dart';
import 'habit_progress_screen.dart';
import '../models/habit.dart';

class HabitListScreen extends StatefulWidget {
  @override
  _HabitListScreenState createState() => _HabitListScreenState();
}

class _HabitListScreenState extends State<HabitListScreen> {
  // Sample habit data with an additional field for whether it is completed today
  final List<Habit> habits = [
    Habit(name: 'Exercise', progress: '3/7 days', completedToday: false),
    Habit(name: 'Read', progress: '5/7 days', completedToday: true),
    Habit(name: 'Meditate', progress: '2/7 days', completedToday: false),
  ];

  void _toggleHabitCompletion(Habit habit) {
    setState(() {
      habit.completedToday = !habit.completedToday;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Habits'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Labels for the columns, centralized
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute equally
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text('Hoje', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                Expanded(
                  child: Center(
                    child: Text('Hábito', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),
                Center(child: Text('Progresso', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure proper distribution
                    crossAxisAlignment: CrossAxisAlignment.center, // Center everything vertically
                    children: [
                      // Centralized Checkbox
                      Center(
                        child: Checkbox(
                          value: habit.completedToday,
                          onChanged: (value) {
                            _toggleHabitCompletion(habit);
                          },
                        ),
                      ),
                      // Centralized Habit Info
                      Expanded(
                        child: Card(
                          color: Colors.white,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: ListTile(
                            title: Text(
                              habit.name,
                              style: TextStyle(
                                color: habit.completedToday ? Colors.green : Colors.teal[800],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Progress: ${habit.progress}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HabitProgressScreen(habit: habit),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // Single Arrow Icon outside the habit name container
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HabitProgressScreen(habit: habit),
                            ),
                          );
                        },
                        child: Center(
                          child: Icon(Icons.arrow_forward, color: Colors.teal),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}