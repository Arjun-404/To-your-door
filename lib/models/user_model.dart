import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String firstname;
  final String email;
  UserModel({
    required this.firstname,
    required this.email,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      firstname: doc['firstname'],
      email: doc['email'],
    );
  }
}