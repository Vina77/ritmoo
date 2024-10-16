class Habit {
  final String name;
  final String progress;
  bool completedToday;

  Habit({
    required this.name,
    required this.progress,
    this.completedToday = false, // Default value for completion
  });
}