import 'dart:io';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photo_zone/common/widgets/cirular_icon.dart';
import 'package:photo_zone/domain_model/image_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';

class ViewPhoto extends StatefulWidget {
  const ViewPhoto({super.key, required this.photos, required this.photoIndex});
  final List<Photo> photos;
  final int photoIndex;
  @override
  State<ViewPhoto> createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto>
    with SingleTickerProviderStateMixin {
  bool showFrame = true;
  int index = 0;
  String? photoTag;
  PhotoViewController controller = PhotoViewController();
  PhotoViewScaleStateController scaleStateController =
      PhotoViewScaleStateController();
  @override
  void initState() {
    super.initState();
    context.read<GalleryManagerCubit>().getPhotoCategory(
        categoryKey: widget.photos[widget.photoIndex].categoryId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryManagerCubit, GalleryManagerState>(
      listener: (context, state) {
        if (state.photoDeleted) {
          context.read<GalleryManagerCubit>().fetchPhotos(
              categoryId: widget.photos[widget.photoIndex].categoryId);
          context.pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          bottomSheet: showFrame
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsetsDirectional.only(
                      top: 10, start: 20, end: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.viewedPhotoCategory.maybeMap(
                        orElse: () => const SizedBox.shrink(),
                        loaded: (value) => Container(
                          padding: const EdgeInsetsDirectional.only(
                            end: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Color(value.data.folderColor),
                              borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    EneftyIcons.tag_2_outline,
                                    size: 25,
                                  )),
                              Text(value.data.categoryName ?? ''),
                            ],
                          ),
                        ),
                      ),
                      CircularIcon(
                        icon: const Icon(EneftyIcons.trash_outline),
                        color: Colors.redAccent,
                        onTap: () {
                          showAdaptiveDialog(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<GalleryManagerCubit>(),
                                child: AlertDialog(
                                  title: Text(
                                      'delete photo'), // To display the title it is optional
                                  content: Text(
                                      'this action will permently remove this photo'), // Message which will be pop up on the screen
                                  // Action widget which will provide the user to acknowledge the choice
                                  actions: [
                                    Text('cancel'),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<GalleryManagerCubit>()
                                            .deletePhoto(
                                                photoIndex: widget.photoIndex);
                                      },
                                      child: Text(
                                        'delete',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                )
              : null,
          body: Stack(
            children: [
              PhotoViewGallery(
                pageController: PageController(initialPage: widget.photoIndex),
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
                          scaleStateController: scaleStateController,
                          minScale: PhotoViewComputedScale.contained,
                          child: InkWell(
                            onTap: () {
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
