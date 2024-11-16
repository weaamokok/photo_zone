import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/deps.dart';
import 'package:photo_zone/feature/photo/logic/photo_cubit.dart';
import 'package:photo_zone/feature/photo/photo_page.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

class PhotoMaker {
  static Widget makePhotoPage(
      {required String photoPath, required int photoKey}) {
    return BlocProvider(
      create: (context) =>
          PhotoCubit(localRepo: locator<LocalStorage>(), photoKey: photoKey)
            ..getCategories(),
      child: PhotoPage(photoPath: photoPath),
    );
  }
}
