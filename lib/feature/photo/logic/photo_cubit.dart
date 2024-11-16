import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_zone/domain_model/generic_state.dart';
import 'package:photo_zone/domain_model/hive_category.dart';
import 'package:photo_zone/domain_model/hive_image_model.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

part 'photo_state.dart';
part 'photo_cubit.freezed.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit({required this.localRepo, required this.photoKey})
      : super(const PhotoState(
            selectedCategory: null,
            photo: GenericState.initial(),
            categories: GenericState.initial(),
            isLoading: false)) {
    fetchPhoto();
    getCategories();
  }
  selectCategory({required HiveCategory selectedCategory}) {
    emit(state.copyWith(selectedCategory: selectedCategory.key));
  }

  void fetchPhoto() async {
    final photo = await localRepo.getPhoto(photoKey: photoKey);
    photo.fold(
      (l) {
        emit(state.copyWith(photo: GenericState.failedProcess(l)));
      },
      (r) {

        emit(state.copyWith(photo: GenericState.loaded(r)));
      },
    );
  }

  addPhotoToCategory() {
    state.photo.maybeMap(
        orElse: () {},
        loaded: (photoModel) {
          final key = photoModel.data.key;
          
          final photo = photoModel.data.copyWith(
            categoryId: state.selectedCategory,
            id: key
          );
          localRepo.updatePhoto(
            photoModel: photo,
          );
        });
  }

  void getCategories() async {
    final response = await localRepo.getCategories();
    response.fold(
      (l) => Println('error$l'),
      (r) {
        if (r != null) {
          if (r.isEmpty) {
            emit(state.copyWith(
                categories: const GenericState.emptyPage(), isLoading: false));
          }
          emit(state.copyWith(
              categories: GenericState.loaded(r), isLoading: false));
        }
      },
    );
  }

  final LocalStorage localRepo;
  final int photoKey;
}
