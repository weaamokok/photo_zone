import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/deps.dart';
import 'package:photo_zone/feature/main_layout/main_layout.dart';
import 'package:photo_zone/feature/main_layout/src/logic/cubit/main_layout_cubit.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';

class MainLayoutComposer {
  static Widget makeMainLayoutPage() {
    return BlocProvider(
      create: (context) =>
          MainLayoutCubit(localStorage: locator<LocalStorage>()),
      child: const MainLayoutPage(),
    );
  }
}
