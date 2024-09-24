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
      print(categoryId);
      final categories = box.values.where((element) {
        if (categoryId == null) return true;
        return element.categoryId == categoryId;
      }).toList();

      return Right(categories);
    } catch (l) {
      print('${l.toString()}');
      return Left(l.toString());
    }
  }

  Future<Either<String, HivePhoto>> getPhoto({int? photoKey}) async {
    try {
      final box = await _localStorage.photosBox;
      final photo = box.values.firstWhere((element) {
        if (photoKey == null) return true;
        print('elemrnmt key ${element.key}');
        return element.key == photoKey;
      });

   
      return Right(photo);
    } catch (l) {
      print(' error in get photo ${l.toString()}');
      return Left(l.toString());
    }
  }

  Future<Either<String, int>> addPhoto({required HivePhoto photoModel}) async {
    try {
      final box = await _localStorage.photosBox;
      final id = await box.add(photoModel);
      return Right(id);
    } catch (error) {
      print(" error in adding ${error.toString()}");
      return Left(error.toString());
    }
  }

  updatePhoto({
    required HivePhoto photoModel,
  }) async {
    try {
      final box = await _localStorage.photosBox;
      final index = box.values.toList().indexWhere((element) {
        print('element ${element.key} photo to edit ${photoModel.id}');
        return element.key == photoModel.id;
      });
      print('index $index');
      if (index != -1) {
        await box.putAt(index, photoModel).then((value) => print('updated '));
      }
      return const Right(unit);
    } catch (error) {
      print(error.toString());
      return Left(error.toString());
    }
  }
}
