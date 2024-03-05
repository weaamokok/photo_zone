// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_category_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddCategoryStateImpl _$$AddCategoryStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AddCategoryStateImpl(
      selectedColorIndex: json['selectedColorIndex'] as int,
      isSubmitting: json['isSubmitting'] as bool,
      folders: (json['folders'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as String))
          .toList(),
      isSuccess: json['isSuccess'] as bool,
      isFailure: json['isFailure'] as bool,
    );

Map<String, dynamic> _$$AddCategoryStateImplToJson(
        _$AddCategoryStateImpl instance) =>
    <String, dynamic>{
      'selectedColorIndex': instance.selectedColorIndex,
      'isSubmitting': instance.isSubmitting,
      'folders': instance.folders,
      'isSuccess': instance.isSuccess,
      'isFailure': instance.isFailure,
    };
