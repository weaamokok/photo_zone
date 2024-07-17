import 'package:dartz/dartz.dart';

import 'package:photo_zone/domain_model/hive_category.dart';
import 'package:photo_zone/domain_model/hive_image_model.dart';
import 'package:photo_zone/local_storage/local_storage.dart';

class LocalStorage {
  LocalStorage({
    required LocalStorageSetup localStorage,
  }) : _localStorage = localStorage;

  final LocalStorageSetup _localStorage;

  Future<Either<String, Unit>> addCategory(
      {required HiveCategory categoryModel}) async {
    try {
      final box = await _localStorage.categoryBox;
      await box.add(categoryModel).then((value) => print('added'));
    } catch (error) {
      return Left(error.toString());
    }

    return const Right(unit);
  }

  Future<Either<String, List<HiveCategory>?>> getCategories() async {
    try {
      final box = await _localStorage.categoryBox;
      final categories = box.values.toList();

      return Right(categories);
    } catch (l) {
      return Left(l.toString());
    }
  }

  Future<void> clearCategory() async {
    final box = await _localStorage.categoryBox;
    box.clear();
  }

  Future<Either<String, List<HivePhoto>?>> getPhotos({int? categoryId}) async {
    try {
      final box = await _localStorage.photosBox;
      final categories = box.values
          .where((element) => element.categoryId == categoryId)
          .toList();

      return Right(categories);
    } catch (l) {
      return Left(l.toString());
    }
  }

  Future<Either<String, Unit>> addPhoto({required HivePhoto photoModel}) async {
    try {
      final box = await _localStorage.photosBox;
      await box.add(photoModel).then((value) => print('added'));

      return const Right(unit);
    } catch (error) {
      print('');
      return Left(error.toString());
    }
  }
}
