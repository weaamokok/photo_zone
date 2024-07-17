import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:photo_zone/domain_model/hive_category.dart';
import 'package:photo_zone/domain_model/hive_image_model.dart';

class LocalStorageSetup {
  LocalStorageSetup(HiveInterface hive) : _hive = hive {
    try {
      _hive
        ..registerAdapter(HiveCategoryAdapter())
        ..registerAdapter(HivePhotoAdapter());
    } catch (_) {}
  }

  final HiveInterface _hive;

  Future<Box<T>> _openHiveBox<T>(String boxName) async {
    if (_hive.isBoxOpen(boxName)) return _hive.box<T>(boxName);
    return await _hive.openBox<T>(boxName);
  }

  Future<Box<HiveCategory>> get categoryBox =>
      _openHiveBox<HiveCategory>(_BoxName.categoryBox);

  Future<Box<HivePhoto>> get photosBox => _openHiveBox<HivePhoto>(
        _BoxName.photoBox,
      );
}

abstract class _BoxName {
  static const String photoBox = "photos";
  static const String categoryBox = "categories";
}
