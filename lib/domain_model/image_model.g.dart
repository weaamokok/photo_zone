// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoImpl _$$PhotoImplFromJson(Map<String, dynamic> json) => _$PhotoImpl(
      photo: (json['photo'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PhotoImplToJson(_$PhotoImpl instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
