import 'package:hive_flutter/adapters.dart';

// part 'hive_category.freezed.dart';

part 'hive_category.g.dart';

// @freezed
// @HiveType(typeId: 2)
// class HiveCategory with _$HiveCategory {
//   const factory HiveCategory({
//     //  @HiveField(0) required int id,
//     @HiveField(1) required String categoryName,
//     @HiveField(2) required int folderColor,
//     @HiveField(3) required DateTime createdAt,
//   }) = _HiveCategory;

//   factory HiveCategory.fromJson(Map<String, dynamic> json) =>
//       _$HiveCategoryFromJson(json);
// }
@HiveType(typeId: 2)
class HiveCategory extends HiveObject {
  HiveCategory({
    required this.categoryName,
    required this.folderColor,
    required this.createdAt,
  });
  @HiveField(0)
  String? categoryName;
  @HiveField(1)
  int folderColor;
  @HiveField(2)
  DateTime createdAt;
}
