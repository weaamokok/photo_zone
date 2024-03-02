import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:photo_zone/remote_service/remote_service_api.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryState(selectedColorIndex: 0));
  final RemoteServiceApi api = RemoteServiceApi();
  final TextEditingController categoryNameController = TextEditingController();
  String? folderColor;
  void AddCategory() async {
    api.createCategory(
        categoryName: categoryNameController.text, folderColor: folderColor);
  }

  void selectFolderColor({required String color, required int index}) {
    folderColor = color.split('(').last;
    folderColor = folderColor?.split(')').first;
    print(folderColor);
    emit(AddCategoryState(selectedColorIndex: index));
  }
}
