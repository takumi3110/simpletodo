// import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String title;
  List<String> item;
  String? description;
  DateTime createdDate;
  DateTime updatedDate;
  DateTime? completedDate;
  // Timestamp createdDate;
  // Timestamp updatedDate;
  // Timestamp? completedDate;

  Todo({
    required this.title,
    required this.item,
    this.description,
    required this.createdDate,
    required this.updatedDate,
    this.completedDate
});
}