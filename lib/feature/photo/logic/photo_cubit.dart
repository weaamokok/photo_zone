import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_zone/domain_model/generic_state.dart';
import 'package:photo_zone/domain_model/hive_category.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

part 'photo_state.dart';
part 'photo_cubit.freezed.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit({required this.localRepo})
      : super(const PhotoState(
            selectedCategory: null,
            categories: GenericState.initial(),
            isLoading: false)) {
    print('init cubit');
    getCategories();
  }
  selectCategory({required HiveCategory selectedCategory}) {
    emit(state.copyWith(selectedCategory: selectedCategory.key));
  }

  void getCategories() async {
    print('----> getCategories');
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
}
