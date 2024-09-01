part of 'photo_cubit.dart';

@freezed
class PhotoState with _$PhotoState {
  const factory PhotoState({
    required GenericState<List<HiveCategory>> categories,
    required bool isLoading,
    required int? selectedCategory,
  }) = _PhotoState;
}
