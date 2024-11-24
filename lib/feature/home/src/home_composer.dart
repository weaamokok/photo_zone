import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/deps.dart';
import 'package:photo_zone/feature/home/src/cubit/add_category_cubit.dart';
import 'package:photo_zone/feature/profile_layout/logic/cubit/profile_cubit.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';
import 'home_page.dart';

class HomeComposer {
  static Widget makeHomePage() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddCategoryCubit>(
          create: (context) =>
              AddCategoryCubit(localRepo: locator<LocalStorage>())
                ..fetchFolders(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) =>
              ProfileCubit(localStorage: locator<LocalStorage>())
                ..fetchUserInfo(),
        ),
      ],
      child: const HomePage(),
    );
  }
}
