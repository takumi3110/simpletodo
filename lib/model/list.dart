import 'package:cloud_firestore/cloud_firestore.dart';

class List {
  String title;
  String item;
  String? description;
  Timestamp createdDate;
  Timestamp updatedDate;
  Timestamp? completedDate;

  List({
    required this.title,
    required this.item,
    this.description,
    required this.createdDate,
    required this.updatedDate,
    this.completedDate
});
}