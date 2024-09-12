import 'package:intl/intl.dart';
import 'package:todolist/model/location.dart';

enum RepeatDays {
  never,
  daily,
  custom,
}

enum Priority {
  none,
  low,
  medium,
  high,
}

class Task {
  final String title;
  String? description;
  bool? isCompleted;
  DateTime? dueDate;
  RepeatDays repeatDays;
  Priority priority;
  Location? location;

  Task({
    required this.title,
    this.description,
    this.isCompleted,
    this.dueDate,
    this.repeatDays = RepeatDays.never,
    this.priority = Priority.none,
    this.location,
  });

  String getDueDate() {
    if (dueDate == null) {
      return 'No due date';
    }
    final DateFormat formatter = DateFormat('HH:mm:ss dd/MM/yyyy');
    return formatter.format(dueDate!);
  }

  String getRepeatDays() {
    switch (repeatDays) {
      case RepeatDays.never:
        return 'Không lặp lại';
      case RepeatDays.daily:
        return 'Hằng ngày';
      case RepeatDays.custom:
        return 'Tùy chọn';
    }
  }

  String getPriority() {
    switch (priority) {
      case Priority.none:
        return 'None';
      case Priority.low:
        return 'Low';
      case Priority.medium:
        return 'Medium';
      case Priority.high:
        return 'High';
    }
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] as String?,
      isCompleted: map['isCompleted'] as bool?,
      dueDate: map['dueDate'] != null ? DateTime.tryParse(map['dueDate'] as String): null,
      repeatDays: RepeatDays.values.firstWhere((repeatDays) => repeatDays.toString() == map['repeatDays'], orElse: () => RepeatDays.never,),
      priority: Priority.values.firstWhere((priority) => priority.toString() == map['priority'], orElse: () => Priority.none),
      location: map['location'] != null ? Location.fromMap(map['location'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'dueDate': dueDate?.toIso8601String(),
      'repeatDays': repeatDays.toString(),
      'priority': priority.toString(),
      'location': location?.toMap(),
    };
  }
}