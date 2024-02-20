import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/feature/main_layout/main_layout.dart';
import 'package:photo_zone/feature/main_layout/src/logic/cubit/main_layout_cubit.dart';

class MainLayoutComposer {
static  Widget makeMainLayoutPage() {
    return BlocProvider(
      create: (context) => MainLayoutCubit(),
      child: const MainLayoutPage(),
    );
  }
}
