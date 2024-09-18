import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'hive_image_model.g.dart';

// @freezed
// @HiveType(typeId: 1)
// class HivePhoto with _$HivePhoto {
//   const factory HivePhoto({
//     @HiveField(0) required int id,
//     @HiveField(1) required List<int> photo,
//     @HiveField(2) int? categoryId,
//     @HiveField(3) required DateTime createdAt,
//   }) = _HivePhoto;

//   factory HivePhoto.fromJson(Map<String, dynamic> json) =>
//       _$HivePhotoFromJson(json);
// }
@HiveType(typeId: 1)
class HivePhoto extends HiveObject {
  HivePhoto({
    required this.image,
    this.categoryId,
    this.id,
    required this.createdAt,
  });
  @HiveField(0)
  String image;
  @HiveField(1)
  int? categoryId;
  @HiveField(2)
  DateTime createdAt;
  @HiveField(3)
  dynamic id;

  HivePhoto copyWith({
    String? image,
    dynamic id,
    int? categoryId,
    DateTime? createdAt,
  }) {
    return HivePhoto(
      image: image ?? this.image,
      id: id ?? super.key,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
