import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RemoteServiceApi {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference users =
      FirebaseFirestore.instance.collection('category');

 void createCategory(
      {required String categoryName, String? folderColor}) async {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'category_name': categoryName, // John Doe
          'created_at': DateTime.now(), // Stokes and Sons
          'folder_color': folderColor // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
