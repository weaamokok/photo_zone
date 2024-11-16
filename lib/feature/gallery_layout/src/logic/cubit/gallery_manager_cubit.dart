import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_zone/domain_model/generic_state.dart';
import 'package:photo_zone/domain_model/hive_category.dart';
import 'package:photo_zone/domain_model/hive_image_model.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

part 'gallery_manager_state.dart';
part 'gallery_manager_cubit.freezed.dart';

class GalleryManagerCubit extends Cubit<GalleryManagerState> {
  GalleryManagerCubit({required this.localRepo})
      : super(GalleryManagerState(
            isSelecting: false,
            photoDeleted: false,
            selectedPhotoList: [],
            photos: const GenericState.initial(),
            viewedPhotoCategory: const GenericState.initial()));

  void searchForTag({required String tag}) {}

  void startSelecting() {
    emit(state.copyWith(isSelecting: !state.isSelecting));
  }

  void selectImage({required HivePhoto photo}) {
    final selectedImages = state.selectedPhotoList.toList();
    if (selectedImages.contains(photo)) {
      selectedImages.removeWhere(
        (element) => element.key == photo.key,
      );
    } else {
      selectedImages.add(photo);
    }
    emit(state.copyWith(selectedPhotoList: selectedImages));
  }

  void fetchPhotos({int? categoryId}) async {
    if (categoryId != null) getPhotoCategory(categoryKey: categoryId);
    //emit(state.copyWith(isSuccess: false));
    //remote
    // final response = await api.fetchFolders();
    final response = await localRepo.getPhotos(categoryId: categoryId);
    response.fold((l) {
      emit(state.copyWith(photos: const GenericState.failedProcess()));
    }, (r) {
      if (r != null && r.isEmpty) {
        emit(state.copyWith(photos: const GenericState.emptyPage()));
        return;
      }
      emit(state.copyWith(
          //remote imp
          // folders:r==null?[] :r
          //     .map((e) => CategoryModel(
          //         categoryName: e.get('category_name'),
          //         folderColor: e.get('folder_color'),
          //         createdAt: e.get('created_at').toString()))
          //     .toList()
          photos: GenericState.loaded(r ?? []
              // .map((e) => Photo(
              //     photo: e.image,
              //     categoryId: e.categoryId,
              //     createdAt: e.createdAt))
              // .toList()
              )));
    });
  }

  void deletePhoto({required List<int> photoIndex}) async {
    final response = await localRepo.deletePhoto(photoKey: photoIndex);
    response.fold(
      (l) => emit(state.copyWith(photoDeleted: false)),
      (r) {
        emit(state.copyWith(
            photoDeleted: true, isSelecting: false, selectedPhotoList: []));
        fetchPhotos();
      },
    );
  }

  void getPhotoCategory({required int categoryKey}) async {
    emit(state.copyWith(viewedPhotoCategory: const GenericState.loading()));
    final response = await localRepo.getCategory(categoryKey: categoryKey);
    response.fold(
      (l) => emit(state.copyWith(
          viewedPhotoCategory: const GenericState.failedProcess())),
      (data) {
        if (data == null) {
          emit(state.copyWith(
              viewedPhotoCategory: const GenericState.emptyPage()));
          return;
        }
        emit(state.copyWith(viewedPhotoCategory: GenericState.loaded(data)));
      },
    );
  }

  final LocalStorage localRepo;
}
