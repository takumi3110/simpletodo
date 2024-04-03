// import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String? id;
  String category;
  String name;
  int? count;
  String? unit;
  int? price;
  String? priority;
  String? shop;
  String? memo;
  DateTime createdDate;
  DateTime updatedDate;
  DateTime? completedDate;
  bool isCompleted;
  bool isRemove;

  // Timestamp createdDate;
  // Timestamp updatedDate;
  // Timestamp? completedDate;

  Item({
    this.id = '',
    required this.category,
    required this.name,
    this.count,
    this.unit,
    this.price,
    this.priority,
    this.shop,
    this.memo,
    required this.createdDate,
    required this.updatedDate,
    this.completedDate,
    this.isCompleted = false,
    this.isRemove = false
});
}