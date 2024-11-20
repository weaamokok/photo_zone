import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:photo_zone/domain_model/category_model.dart';
import 'package:photo_zone/domain_model/hive_category.dart';
import 'package:photo_zone/feature/home/src/cubit/add_category_state.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';
import 'package:photo_zone/remote_service/remote_service_api.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit({required this.localRepo})
      : super(const AddCategoryState(
            folders: [],
            selectedColorIndex: 0,
            isSubmitting: false,
            isSuccess: false,
            isFailure: false));
  final RemoteServiceApi api = RemoteServiceApi();
  final LocalStorage localRepo;
  final TextEditingController categoryNameController = TextEditingController();
  int? folderColor;
  void addCategory() async {
    emit(
        state.copyWith(isSubmitting: true, isSuccess: false, isFailure: false));
    //remote
    // final response = await api.createCategory(
    //     categoryName: categoryNameController.text,
    //     folderColor: state.selectedColorIndex == 0 ? 0xffB7C9F2 : folderColor);
    final response = await localRepo.addCategory(
        categoryModel: HiveCategory(
            categoryName: categoryNameController.text,
            folderColor: state.selectedColorIndex != 0
                ? folderColor ?? 0xffB7C9F2
                : 0xffB7C9F2,
            createdAt: DateTime.now()));
    response.fold(
        (l) => emit(state.copyWith(
            isSubmitting: false, isFailure: true, isSuccess: false)),
        (r) => emit(state.copyWith(
            isSubmitting: false, isSuccess: true, isFailure: false)));
  }

  void fetchFolders() async {
    //emit(state.copyWith(isSuccess: false));
    //remote
    // final response = await api.fetchFolders();
    final response = await localRepo.getCategories();
    response.fold(
        (l) => emit(state.copyWith(isFailure: true)),
        (r) {
          
          emit(state.copyWith(
            isSuccess: false,
            //remote imp
            // folders:r==null?[] :r
            //     .map((e) => CategoryModel(
            //         categoryName: e.get('category_name'),
            //         folderColor: e.get('folder_color'),
            //         createdAt: e.get('created_at').toString()))
            //     .toList()
            folders: r == null
                ? []
                : r
                    .map((e) => CategoryModel(
                        id: e.key,
                        categoryName: e.categoryName ?? '',
                        folderColor: e.folderColor,
                        createdAt: e.createdAt.toString()))
                    .toList()));
        });
  }

  void selectFolderColor({required String color, required int index}) {
    String colorCode = color.split('(').last;
    colorCode = colorCode.split(')').first;
    folderColor = int.tryParse(colorCode);
    emit(state.copyWith(selectedColorIndex: index));
  }
}
