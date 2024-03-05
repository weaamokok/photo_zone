import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class RemoteServiceApi {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference categoryRef =
      FirebaseFirestore.instance.collection('category');

  Future<Either<String, DocumentReference<Object?>>> createCategory(
      {required String categoryName, int? folderColor}) async {
    // Call the user's CollectionReference to add a new user
    try {
      final response = await categoryRef.add({
        'category_name': categoryName, // John Doe
        'created_at': DateTime.now(), // Stokes and Sons
        'folder_color': folderColor // 42
      });
      return right(response);
    } on FirebaseException catch (e) {
      return left(e.message!);
    }
  }

  Future<Either<String, List<QueryDocumentSnapshot>>>
      fetchFolders() async {
    // Call the user's CollectionReference to add a new user
    try {
      final response = await categoryRef.get();
      return right(response.docs);
    } on FirebaseException catch (e) {
      return left(e.message!);
    }
  }
}
