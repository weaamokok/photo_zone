// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  int id;
  String categoryName;
  int folderColor;
  String createdAt;
  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.folderColor,
    required this.createdAt,
  });

  CategoryModel copyWith({
    int? id,
    String? categoryName,
    int? folderColor,
    String? createdAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      folderColor: folderColor ?? this.folderColor,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'categoryName': categoryName});
    result.addAll({'folderColor': folderColor});
    result.addAll({'createdAt': createdAt});

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toInt() ?? 0,
      categoryName: map['categoryName'] ?? '',
      folderColor: map['folderColor']?.toInt() ?? 0,
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(id: $id, categoryName: $categoryName, folderColor: $folderColor, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
      other.id == id &&
        other.categoryName == categoryName &&
        other.folderColor == folderColor &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryName.hashCode ^
        folderColor.hashCode ^
        createdAt.hashCode;
  }
}
