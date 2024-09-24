import 'dart:io';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photo_zone/domain_model/image_model.dart';

class ViewPhoto extends StatefulWidget {
  const ViewPhoto({super.key, required this.photos});
  final List<Photo> photos;
  @override
  State<ViewPhoto> createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool showFrame = true;
  int index = 0;
  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: showFrame
          ? Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(widget.photos[1].categoryId.toString()),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(EneftyIcons.tag_2_outline))
                    ],
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
            pageOptions: [
              ...widget.photos
                  .map((iamge) => PhotoViewGalleryPageOptions.customChild(
                          child: InkWell(
                        onTap: () {
                          print('photo pressed $showFrame');
                          setState(() {
                            showFrame = !showFrame;
                          });
                        },
                        child: Image.file(
                          File(iamge.photo),
                          fit: BoxFit.cover,
                        ),
                      ))),
            ],
          ),
          if (showFrame) SizedBox(height: 70, child: AppBar()),
        ],
      ),
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
