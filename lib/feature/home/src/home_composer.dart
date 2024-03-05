import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/feature/home/src/cubit/add_category_cubit.dart';

import 'home_page.dart';

class HomeComposer {
  static Widget makeHomePage() {
    return BlocProvider<AddCategoryCubit>(
      create: (context) => AddCategoryCubit()..fetchFolders(),
      child: const HomePage(),
    );
  }
}
