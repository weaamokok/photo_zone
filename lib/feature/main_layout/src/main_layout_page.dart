import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_zone/feature/gallery_layout/src/add_image_sheet_composer.dart';
import 'package:photo_zone/feature/home/src/home_composer.dart';
import 'package:photo_zone/feature/main_layout/src/logic/cubit/main_layout_cubit.dart';
import 'package:photo_zone/helpers/image_picker.dart';

class MainLayoutPage extends StatelessWidget {
  const MainLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainLayoutCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: BlocBuilder<MainLayoutCubit, MainLayoutState>(
        builder: (context, state) {
          return pages.elementAt(state.index);
        },
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(
              40,
            )),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: 75,
        child: DotNavigationBar(
          splashColor: Colors.black,
          backgroundColor: Colors.white,
          borderRadius: 30,
          paddingR: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          marginR: const EdgeInsets.symmetric(horizontal: 0),
          currentIndex: 0,
          onTap: (p0) async {
            if (p0 == 1) {
              final file =
                  await selectOrTakePhoto(ImageSource.camera).then((value) {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => AddImageComposer.makeAddImageSheet(),
                );
              });
            }
            bloc.changeIndex(p0);
          },
          dotIndicatorColor: Colors.black,
          items: _items,
        ),
      ),
    );
  }
}

final List<Widget> pages = [
  HomeComposer.makeHomePage(),
  const Center(
    child: Text('Camera'),
  ),
  const Center(
    child: Text('Profile'),
  ),
];

List<DotNavigationBarItem> _items = [
  DotNavigationBarItem(
    icon: const Icon(EneftyIcons.home_2_outline),
    selectedColor: Colors.black,
  ),
  DotNavigationBarItem(
    icon: const Icon(EneftyIcons.camera_outline),
    selectedColor: Colors.black,
  ),
  DotNavigationBarItem(
    icon: const Icon(EneftyIcons.user_outline),
    selectedColor: Colors.black,
  ),
];
