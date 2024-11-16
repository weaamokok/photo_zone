part of 'gallery_manager_cubit.dart';

@freezed
class GalleryManagerState with _$GalleryManagerState {
  factory GalleryManagerState(
          {required GenericState<List<HivePhoto>> photos,
          required List<HivePhoto> selectedPhotoList,
          required bool photoDeleted,
          required bool isSelecting,
          required GenericState<HiveCategory> viewedPhotoCategory}) =
      _GalleryManagerState;
}
