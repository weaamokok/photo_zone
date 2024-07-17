import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/deps.dart';
import 'package:photo_zone/feature/gallery_layout/src/gallery_layout_page.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

class GalleryComposer {
  static Widget makeGallery({int? categoryId}) {
    return BlocProvider<GalleryManagerCubit>(
      create: (context) =>
          GalleryManagerCubit(localRepo: locator<LocalStorage>())
            ..fetchPhotos(categoryId: categoryId),
      child: const GalleryLayoutPage(),
    );
  }
}
