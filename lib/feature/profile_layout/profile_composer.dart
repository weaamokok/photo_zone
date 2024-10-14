import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/deps.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';
import 'package:photo_zone/feature/profile_layout/logic/cubit/profile_cubit.dart';
import 'package:photo_zone/feature/profile_layout/profile_page.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

class ProfileComposer {
  static Widget makeProfilePage() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (context) =>
              ProfileCubit(localStorage: locator<LocalStorage>())
                ..fetchUserInfo(),
        ),
        BlocProvider<GalleryManagerCubit>(
          create: (context) =>
              GalleryManagerCubit(localRepo: locator<LocalStorage>())
                ..fetchPhotos(),
        ),
      ],
      child: const ProfilePage(),
    );
  }
}
