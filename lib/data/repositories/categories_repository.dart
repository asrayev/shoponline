import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/my_utils.dart';
import '../models/category.dart';

class CategoryRepository {
  final FirebaseFirestore _firestore;

  CategoryRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addCategory({required CategoryModel categoryModel}) async {
    try {
      DocumentReference newCategory =
      await _firestore.collection("categories").add(categoryModel.toJson());
      await _firestore.collection("categories").doc(newCategory.id).update({
        "categoryId": newCategory.id,
      });
      MyUtils.getMyToast(message: "Category added successfully");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> deleteCategory({required String docId}) async {
    try {
      await _firestore.collection("categories").doc(docId).delete();
      MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> updateCategory({required CategoryModel categoryModel}) async {
    try {
      await _firestore
          .collection("categories")
          .doc(categoryModel.categoryId)
          .update(categoryModel.toJson());

      MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli yangilandi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Stream<List<CategoryModel>> getCategories() =>
      _firestore.collection("categories").snapshots().map(
            (event1) => event1.docs
            .map((doc) => CategoryModel.fromJson(doc.data()))
            .toList(),
      );
}