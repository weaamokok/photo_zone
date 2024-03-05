import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:photo_zone/domain_model/category_model.dart';
import 'package:photo_zone/feature/home/src/cubit/add_category_state.dart';
import 'package:photo_zone/remote_service/remote_service_api.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit()
      : super(const AddCategoryState(
            folders: [],
            selectedColorIndex: 0,
            isSubmitting: false,
            isSuccess: false,
            isFailure: false));
  final RemoteServiceApi api = RemoteServiceApi();
  final TextEditingController categoryNameController = TextEditingController();
  int? folderColor;
  void addCategory() async {
    emit(
        state.copyWith(isSubmitting: true, isSuccess: false, isFailure: false));
    final response = await api.createCategory(
        categoryName: categoryNameController.text,
        folderColor: state.selectedColorIndex == 0 ? 0xffB7C9F2 : folderColor);
    response.fold(
        (l) => emit(state.copyWith(
            isSubmitting: false, isFailure: true, isSuccess: false)),
        (r) => emit(state.copyWith(
            isSubmitting: false, isSuccess: true, isFailure: false)));
  }

  void fetchFolders() async {
    //emit(state.copyWith(isSuccess: false));
    final response = await api.fetchFolders();
    response.fold(
        (l) => emit(state.copyWith(isFailure: true)),
        (r) => emit(state.copyWith(isSuccess: false,
            folders: r
                .map((e) => CategoryModel(
                    categoryName: e.get('category_name'),
                    folderColor: e.get('folder_color'),
                    createdAt: e.get('created_at').toString()))
                .toList())));
  }

  void selectFolderColor({required String color, required int index}) {
    String colorCode = color.split('(').last;
    colorCode = colorCode.split(')').first;
    folderColor = int.tryParse(colorCode);
    print(folderColor);
    emit(state.copyWith(selectedColorIndex: index));
  }
}
