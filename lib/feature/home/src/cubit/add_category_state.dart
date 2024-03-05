import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_zone/domain_model/category_model.dart';

part 'add_category_state.freezed.dart';
part 'add_category_state.g.dart';

@freezed
class AddCategoryState with _$AddCategoryState {
  const factory AddCategoryState(
      {required int selectedColorIndex,
      required bool isSubmitting,
      required List<CategoryModel> folders,
      required bool isSuccess,
      required bool isFailure}) = _AddCategoryState;
  factory AddCategoryState.fromJson(Map<String, dynamic> json) =>
      _$AddCategoryStateFromJson(json);
}
