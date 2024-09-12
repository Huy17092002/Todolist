enum Priority {
  none,
  low,
  medium,
  high
}

class TaskModel {
  final String title;
  String? description;
  bool? isCompleted;
  DateTime? dueDate;
  int? repeatDays;
  Priority? priority;
  Location? location;

  TaskModel({
    required this.title,
    this.description,
    this.isCompleted,
    this.dueDate,
    this.repeatDays,
    this.priority,
    this.location,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'],
      dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null,
      repeatDays: map['repeatDays'],
      priority: Priority.values.firstWhere(
            (repeatDays) => repeatDays.toString() == map['priority'],
      ),
      location: map['location'] != null
          ? Location.fromMap(map['location'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'dueDate': dueDate?.toString(),
      'repeatDays': repeatDays,
      'priority': priority.toString(),
      'location': location?.toMap(),
    };
  }
}


enum LocationType {
  currentLocation,
  departurePoint,
  destinationPoint,
  location,
}

class Location {
  final String address;
  final LocationType type;

  Location({
    required this.address,
    required this.type,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      address: map['address'],
      type: LocationType.values.firstWhere(
            (type) => type.toString().split(',').last == map['type'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'type': type.toString().split(',').last,
    };
  }
}











