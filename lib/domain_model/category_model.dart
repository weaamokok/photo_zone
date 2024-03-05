// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  String categoryName;
  int folderColor;
  String createdAt;
  CategoryModel({
    required this.categoryName,
    required this.folderColor,
    required this.createdAt,
  });

  CategoryModel copyWith({
    String? categoryName,
    int? folderColor,
    String? createdAt,
  }) {
    return CategoryModel(
      categoryName: categoryName ?? this.categoryName,
      folderColor: folderColor ?? this.folderColor,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryName': categoryName,
      'folderColor': folderColor,
      'createdAt': createdAt,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryName: map['categoryName'] as String,
      folderColor: map['folderColor'] as int,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoryModel(categoryName: $categoryName, folderColor: $folderColor, createdAt: $createdAt)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.categoryName == categoryName &&
        other.folderColor == folderColor &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode =>
      categoryName.hashCode ^ folderColor.hashCode ^ createdAt.hashCode;
}
