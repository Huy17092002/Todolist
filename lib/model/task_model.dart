// class TaskModel {
//   final String id;
//   String title;
//   bool isCompleted;
//   bool isImportant;
//   final DateTime createDate;
//   DateTime? dueDate;
//   String? repeat;
//   String? note;
//
//   TaskModel({
//     required this.id,
//     required this.title,
//     required this.isCompleted,
//     required this.isImportant,
//     required this.createDate,
//     this.dueDate,
//     this.repeat,
//     this.note,
//   });
//
//   TaskModel copyWith({
//     String? id,
//     String? title,
//     bool? isCompleted,
//     bool? isImportant,
//     DateTime? createDate,
//     DateTime? dueDate,
//     String? repeat,
//     String? note,
//   }) {
//     return TaskModel(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       isCompleted: isCompleted ?? this.isCompleted,
//       isImportant: isImportant ?? this.isImportant,
//       createDate: createDate ?? this.createDate,
//       dueDate: dueDate ?? this.dueDate,
//       repeat: repeat ?? this.repeat,
//       note: note ?? this.note,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       'isCompleted': isCompleted,
//       'isImportant': isImportant,
//       'createDate': createDate,
//       'dueDate': dueDate,
//       'repeat': repeat,
//       'note': note,
//     };
//   }
//
//   factory TaskModel.fromMap(Map<String, dynamic> map) {
//     return TaskModel(
//       id: map['id'] ?? '-1',
//       title: map['title'] ?? 'title',
//       isCompleted: map['isCompleted'] ?? false,
//       isImportant: map['isImportant'] ?? false,
//       createDate: (map['createDate'] is DateTime) ? map['createDate'] : DateTime.parse(map['createDate']),
//       dueDate: (map['dueDate'] is DateTime)
//           ? map['dueDate']
//           : (map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null),
//       repeat: map['repeat'],
//       note: map['note'],
//     );
//   }
// }




// class TaskModel {
//   final String id;
//   String title;
//   bool isCompleted;
//   bool isImportant;
//   final DateTime createDate;
//   DateTime? dueDate;
//   String? repeat;
//   String? note;
//
//   TaskModel({
//     required this.id,
//     required this.title,
//     required this.isCompleted,
//     required this.isImportant,
//     required this.createDate,
//     this.dueDate,
//     this.repeat,
//     this.note, required String description, required bool completed,
//   });
// }

//
// class TaskModel{
//   final String title;
//
//   TaskModel({required this.title});
// }

//
class TaskModel {
  final String id;
  String title;

  TaskModel({required this.title}) : id = DateTime.now().toString();


  void updateTitle(String newTitle) {
    title = newTitle;
  }
}



