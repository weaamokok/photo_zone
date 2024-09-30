import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/deps.dart';
import 'package:photo_zone/domain_model/image_model.dart';

import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';
import 'package:photo_zone/feature/gallery_layout/src/widget/view_photo.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

class ViewPhotoComposer {
  static Widget makePhoto({required List<Photo> photos}) {
    return BlocProvider<GalleryManagerCubit>(
      create: (context) =>
          GalleryManagerCubit(localRepo: locator<LocalStorage>()),
      child: ViewPhoto(
        photos: photos,
      ),
    );
  }
}
