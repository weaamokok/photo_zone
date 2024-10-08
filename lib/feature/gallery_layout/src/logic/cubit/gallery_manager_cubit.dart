import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_zone/domain_model/generic_state.dart';
import 'package:photo_zone/domain_model/hive_category.dart';
import 'package:photo_zone/domain_model/hive_image_model.dart';
import 'package:photo_zone/domain_model/image_model.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

part 'gallery_manager_state.dart';
part 'gallery_manager_cubit.freezed.dart';

class GalleryManagerCubit extends Cubit<GalleryManagerState> {
  GalleryManagerCubit({required this.localRepo})
      : super(GalleryManagerState(
            photoDeleted: false,
            photos: const GenericState.initial(),
            viewedPhotoCategory: const GenericState.initial()));
  void fetchPhotos({int? categoryId}) async {
    //emit(state.copyWith(isSuccess: false));
    //remote
    // final response = await api.fetchFolders();
    final response = await localRepo.getPhotos(categoryId: categoryId);
    response.fold((l) {
      print('error: $l');
      emit(state.copyWith(photos: const GenericState.failedProcess()));
    }, (r) {
      if (r != null && r.isEmpty) {
        emit(state.copyWith(photos: const GenericState.emptyPage()));
        return;
      }
      print('object: $r');
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

  void deletePhoto({required int photoIndex}) async {
    emit(state.copyWith(photos: const GenericState.loading()));
    final response = await localRepo.deletePhoto(photoKey: photoIndex);
    response.fold(
      (l) => emit(state.copyWith(photos: const GenericState.failedProcess())),
      (r) {
        print('deleted');
        emit(state.copyWith(photoDeleted: true));
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
