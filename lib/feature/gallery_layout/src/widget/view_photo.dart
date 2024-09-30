import 'dart:io';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photo_zone/domain_model/image_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';

class ViewPhoto extends StatefulWidget {
  const ViewPhoto({super.key, required this.photos});
  final List<Photo> photos;
  @override
  State<ViewPhoto> createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto>
    with SingleTickerProviderStateMixin {
  bool showFrame = true;
  int index = 0;
  String? photoTag;
  PhotoViewController controller = PhotoViewController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryManagerCubit, GalleryManagerState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          bottomSheet: showFrame
              ? Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      state.viewedPhotoCategory.maybeMap(
                        orElse: () => const SizedBox.shrink(),
                        loaded: (value) => Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(EneftyIcons.tag_2_outline)),
                              Text(value.data.categoryName ?? ''),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : null,
          body: Stack(
            children: [
              PhotoViewGallery(
                customSize: MediaQuery.sizeOf(context),
                gaplessPlayback: true,
                onPageChanged: (index) =>
                    widget.photos[index].categoryId != null
                        ? context.read<GalleryManagerCubit>().getPhotoCategory(
                            categoryKey: widget.photos[index].categoryId!)
                        : null,
                pageOptions: [
                  ...widget.photos
                      .map((image) => PhotoViewGalleryPageOptions.customChild(
                          controller: controller,
                          child: InkWell(
                            onTap: () {
                              print('photo pressed $showFrame');
                              setState(() {
                                showFrame = !showFrame;
                              });
                            },
                            child: Image.file(
                              File(image.photo),
                              fit: BoxFit.cover,
                            ),
                          ))),
                ],
              ),
              if (showFrame)
                SizedBox(
                    height: 70,
                    child: AppBar(
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () => context.pop(),
                      ),
                    )),
            ],
          ),
        );
      },
    );
  }
}

class SlidingPhotoAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  SlidingPhotoAppBar({
    required this.controller,
    required this.visible,
  });

  final AnimationController controller;
  final bool visible;

  @override
  @override
  Widget build(BuildContext context) {
    visible ? controller.reverse() : controller.forward();
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: Offset(0, -1)).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
      ),
      child: AppBar(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
