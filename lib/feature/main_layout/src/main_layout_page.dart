import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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
      //  backgroundColor: const Color(0xffffffff),
      body: BlocBuilder<MainLayoutCubit, MainLayoutState>(
        builder: (context, state) {
          return pages.elementAt(state.index);
        },
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            //   color: Colors.white,
            border: Border.all(
                width: 1, color: Theme.of(context).canvasColor.onColor),
            borderRadius: BorderRadius.circular(
              40,
            )),
        margin: const EdgeInsets.only(bottom: 20, right: 15, left: 15),
        height: 90,
        child: DotNavigationBar(
          // splashColor: Colors.black,
          // unselectedItemColor:   Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          //   selectedItemColor:   Theme.of(context).bottomNavigationBarTheme.selectedItemColor,

          backgroundColor: Colors.transparent,
          borderRadius: 30,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          paddingR: const EdgeInsets.only(bottom: 0, top: 0),
          itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          enableFloatingNavBar: false,
          marginR: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          currentIndex: 0,
          onTap: (p0) async {
            if (p0 == 1) {
              final image =
                  await selectOrTakePhoto(ImageSource.camera).then((image) {
                print(image);

                if (image != null) {
                  bloc.addPhoto(image: image);
                }
                // showModalBottomSheet(
                //   context: context,
                //   builder: (_) => AddImageComposer.makeAddImageSheet(),
                // );
              });
            }
            bloc.changeIndex(p0);
          },
          dotIndicatorColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
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
    // selectedColor: Colors.black,
  ),
  DotNavigationBarItem(
    icon: const Icon(EneftyIcons.camera_outline),
    // selectedColor: Colors.black,
  ),
  DotNavigationBarItem(
    icon: const Icon(EneftyIcons.user_outline),
    // selectedColor: Colors.black,
  ),
];
