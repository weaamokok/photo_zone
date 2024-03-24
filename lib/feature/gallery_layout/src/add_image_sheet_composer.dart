import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';
import 'package:photo_zone/feature/gallery_layout/src/widget/add_image_sheet.dart';

class AddImageComposer {
  static Widget makeAddImageSheet() {
    return BlocProvider<GalleryManagerCubit>(
      create: (context) => GalleryManagerCubit(),
      child: const AddImageSheet(),
    );
  }
}
