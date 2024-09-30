part of 'gallery_manager_cubit.dart';

@freezed
class GalleryManagerState with _$GalleryManagerState {
  factory GalleryManagerState(
          {required GenericState<List<Photo>> photos,
          required GenericState<HiveCategory> viewedPhotoCategory}) =
      _GalleryManagerState;
}
