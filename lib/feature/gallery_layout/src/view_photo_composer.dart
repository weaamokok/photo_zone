import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/deps.dart';
import 'package:photo_zone/domain_model/hive_image_model.dart';

import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';
import 'package:photo_zone/feature/gallery_layout/src/widget/view_photo.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

class ViewPhotoComposer {
  static Widget makePhoto({required List<HivePhoto> photos,required int photoIndex}) {
    return BlocProvider<GalleryManagerCubit>(
      create: (context) =>
          GalleryManagerCubit(localRepo: locator<LocalStorage>()),
      child: ViewPhoto(photoIndex: photoIndex,
        photos: photos,
      ),
    );
  }
}
