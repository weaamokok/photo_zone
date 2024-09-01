import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:photo_zone/domain_model/hive_image_model.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit({required this.localStorage})
      : super(const MainLayoutState(index: 0));
  void changeIndex(int index) {
    emit(MainLayoutState(index: index));
  }

  void addPhoto({required File image, int? categoryId}) async {
    print(';here');
    final imagePath = image.path;
    await localStorage.addPhoto(
        photoModel: HivePhoto(
      image: imagePath,
      createdAt: DateTime.now(),
      categoryId: categoryId,
    ));
  }

  final LocalStorage localStorage;
}
