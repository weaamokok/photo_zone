import 'dart:io';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_zone/common/widgets/category_tag.dart';
import 'package:photo_zone/common/widgets/cirular_icon.dart';
import 'package:photo_zone/common/widgets/empty_state_widget.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';
import 'package:photo_zone/utils/theme.dart';

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
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: AppBar(
                actions: [
                  state.isSelecting && state.selectedPhotoList.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsetsDirectional.only(end: 20.0),
                          child: CircularIcon(
                            icon: const Icon(EneftyIcons.trash_outline),
                            color: Colors.redAccent,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                constraints:
                                    const BoxConstraints(maxHeight: 200),
                                builder: (_) => BlocProvider.value(
                                  value: context.read<GalleryManagerCubit>(),
                                  child: AlertDialog(
                                    actionsAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    title: const Text(
                                        'delete photo'), // To display the title it is optional
                                    content: const Text(
                                      'this action will permently remove this photo',
                                      style:
                                          TextStyle(color: Color(0xff282828)),
                                    ), // Message which will be pop up on the screen
                                    // Action widget which will provide the user to acknowledge the choice
                                    actions: [
                                      const Text('cancel'),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.redAccent),
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))))),
                                          onPressed: () {
                                            if (state
                                                .selectedPhotoList.isNotEmpty) {
                                              context
                                                  .read<GalleryManagerCubit>()
                                                  .deletePhoto(
                                                      photoIndex: state
                                                          .selectedPhotoList
                                                          .map(
                                                            (e) => e.key as int,
                                                          )
                                                          .toList());
                                            }

                                            context.pop();
                                          },
                                          child: const Text(
                                            'delete',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                              // showAdaptiveDialog(
                              //   context: context,
                              //   builder: (_) {
                              //     return BlocProvider.value(
                              //       value: context.read<GalleryManagerCubit>(),
                              //       child: AlertDialog(
                              //         actionsAlignment:
                              //             MainAxisAlignment.center,
                              //         title: const Text(
                              //             'delete photo'), // To display the title it is optional
                              //         content: const Text(
                              //             'this action will permently remove this photo'), // Message which will be pop up on the screen
                              //         // Action widget which will provide the user to acknowledge the choice
                              //         actions: [
                              //           const Text('cancel'),
                              //           const SizedBox(
                              //             width: 20,
                              //           ),
                              //           ElevatedButton(
                              //               style: const ButtonStyle(
                              //                   backgroundColor:
                              //                       WidgetStatePropertyAll(
                              //                           Colors.redAccent),
                              //                   shape: WidgetStatePropertyAll(
                              //                       RoundedRectangleBorder(
                              //                           borderRadius:
                              //                               BorderRadius.all(
                              //                                   Radius.circular(
                              //                                       10))))),
                              //               onPressed: () {
                              //                 if (state.selectedPhotoList !=
                              //                     null) {
                              //                   if (state.selectedPhotoList!
                              //                       .isNotEmpty) {
                              //                     context
                              //                         .read<
                              //                             GalleryManagerCubit>()
                              //                         .deletePhoto(
                              //                             photoIndex: state
                              //                                 .selectedPhotoList!
                              //                                 .map(
                              //                                   (e) =>
                              //                                       int.parse(
                              //                                           e.key),
                              //                                 )
                              //                                 .toList());
                              //                   }
                              //                 }
                              //                 context.pop();
                              //               },
                              //               child: const Text(
                              //                 'delete',
                              //                 style: TextStyle(
                              //                     fontSize: 14,
                              //                     color: Colors.white),
                              //               )),
                              //         ],
                              //       ),
                              //     );
                              //   },
                              // );
                            },
                          ),
                        )
                      : const SizedBox.shrink()
                ],
                title: state.viewedPhotoCategory.maybeMap(
                  orElse: () => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: SizedBox(
                        height: 55,
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
                        ),
                      )),
                  loaded: (value) => SizedBox(
                    height: 40,
                    child: CategoryTag(category: value.data),
                  ),
                ),
                elevation: 0,
                leading: context.canPop()
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () => context.pop(),
                      )
                    : null,
              ),
            ), //hdhdkz
            body: state.photos.maybeMap(
              failedProcess: (value) => const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      EneftyIcons.emoji_sad_outline,
                      color: Color(0xffE6A4B4),
                      size: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Somthing went wrong 🌚',
                      style: TextStyle(color: Color(0xff282828)),
                    )
                  ],
                ),
              ),
              emptyPage: (value) => const EmptyStateWidget(
                  icon: EneftyIcons.folder_2_bold,
                  text: 'No Photos in this folder yet 🌝'),
              orElse: () => const SizedBox.shrink(),
              loading: (value) => const CircularProgressIndicator(),
              loaded: (value) {
                final bloc = context.read<GalleryManagerCubit>();
                final images = value.data;
                return GridView.builder(
                  itemCount: value.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => Stack(
                    fit: StackFit.expand,
                    children: [
                      InkWell(
                        onLongPress: () => bloc.startSelecting(),
                        onTap: () async {
                          final result = await context.pushNamed('viewPhoto',
                              extra: value.data,
                              pathParameters: {'photoIndex': index.toString()});
                          if (result == true) {
                            bloc.fetchPhotos(
                                categoryId: value.data[index].categoryId);
                          }
                        },
                        child: Image.file(
                          File(value.data[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      state.isSelecting
                          ? Align(
                              alignment: AlignmentDirectional.topStart,
                              child: CheckboxListTile(
                                checkColor:
                                    AppTheme.appTheme.colorScheme.onPrimary,
                                checkboxShape: CircleBorder(
                                    side: BorderSide(
                                        color: AppTheme.appTheme.primaryColor)),
                                value: state.selectedPhotoList
                                    .contains(images[index]),
                                onChanged: (value) =>
                                    bloc.selectImage(photo: images[index]),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                );
              },
            ));
      },
    );
  }
}
