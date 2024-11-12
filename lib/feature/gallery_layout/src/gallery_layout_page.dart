import 'dart:io';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_zone/common/widgets/category_tag.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';

class GalleryLayoutPage extends StatefulWidget {
  const GalleryLayoutPage({super.key});

  @override
  State<GalleryLayoutPage> createState() => _GalleryLayoutPageState();
}

class _GalleryLayoutPageState extends State<GalleryLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryManagerCubit, GalleryManagerState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: state.viewedPhotoCategory.maybeMap(
                orElse: () => null,
                loaded: (value) => SizedBox(
                  height: 40,
                  child: CategoryTag(category: value.data),
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: state.viewedPhotoCategory.maybeMap(
                    orElse: () => Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          onChanged: (value) {
                            context.read<GalleryManagerCubit>();

                          },
                          decoration: InputDecoration(
                              hintText: 'Search by photo tag',
                              prefixIcon: const Icon(
                                  EneftyIcons.search_favorite_outline),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xff282828)),
                                  borderRadius: BorderRadius.circular(30)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20)),
                        )),
                  )),
              elevation: 0,
              leading: context.canPop()
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () => context.pop(),
                    )
                  : null,
            ), //hdhdkz
            body: state.photos.maybeMap(
              failedProcess: (value) => const Text('error'),
              emptyPage: (value) => const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      EneftyIcons.folder_2_bold,
                      color: Color(0xffE6A4B4),
                      size: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'No Photos in this folder yet 🌝',
                      style: TextStyle(color: Color(0xff282828)),
                    )
                  ],
                ),
              ),
              orElse: () => const SizedBox.shrink(),
              loading: (value) => const CircularProgressIndicator(),
              loaded: (value) => GridView.builder(
                itemCount: value.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2, crossAxisSpacing: 2, crossAxisCount: 2),
                itemBuilder: (context, index) => InkWell(
                  onTap: () async {
                    final result = await context.pushNamed('viewPhoto',
                        extra: value.data,
                        pathParameters: {'photoIndex': index.toString()});
                    if (result == true) {
                      context.read<GalleryManagerCubit>().fetchPhotos(
                          categoryId: value.data[index].categoryId);
                    }
                  },
                  child: Image.file(
                    File(value.data[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ));
      },
    );
  }
}
