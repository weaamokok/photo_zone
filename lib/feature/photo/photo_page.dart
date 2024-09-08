import 'dart:io';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/feature/home/src/home_page.dart';

import 'package:photo_zone/feature/photo/logic/photo_cubit.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({required this.photoPath, super.key});
  final String photoPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.file(
              File(photoPath),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsetsDirectional.only(
                    bottom: 5, end: 5, start: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                width: double.infinity,
                child: BlocBuilder<PhotoCubit, PhotoState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(
                                end: 10, top: 20),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, border: Border.all()),
                            width: 45,
                            height: 45,
                            padding: const EdgeInsets.only(bottom: 5),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.green,
                              child: IconButton(
                                icon: const Icon(
                                  EneftyIcons.tick_circle_outline,
                                ),
                                onPressed: () {
                                  if (state.selectedCategory != null) {
                                    // context.read<PhotoCubit>().addPhotoToCategory(state.selectedCategory!, photoPath);
                                  }
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'you wanna add this photo to a category?',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        state.categories.maybeMap(
                          orElse: () =>
                              const CircularProgressIndicator.adaptive(),
                          loaded: (value) => Wrap(
                            children: value.data
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      context.read<PhotoCubit>().selectCategory(
                                          selectedCategory: e.key);
                                    },
                                    child: Container(
                                      margin: const EdgeInsetsDirectional.only(
                                          end: 5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Text(
                                        e.categoryName ?? '',
                                        style: const TextStyle(
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList()
                              ..add(InkWell(
                                child: Container(    padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                  margin:
                                      const EdgeInsetsDirectional.only(end: 5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        EneftyIcons.add_circle_outline,
                                        color: Colors.black45,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'add category',
                                        style: TextStyle(
                                       
                                            color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          ),
                        ),
                        // ElevatedButton(
                        //   style: ButtonStyle(
                        //       elevation: const WidgetStatePropertyAll(0),
                        //       shape: WidgetStatePropertyAll(
                        //           RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20),
                        //               side: const BorderSide(
                        //                   color: Colors.black26))),
                        //       backgroundColor:
                        //           const WidgetStatePropertyAll(Colors.white)),
                        //   onPressed: () {},
                        //   child: const ,
                        // )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        )
        //  Stack(
        //   children: [
        //     Flexible(
        //         flex: 10,
        //         child: Image.file(
        //           File(photoPath),
        //           width: MediaQuery.of(context).size.width,
        //           height: MediaQuery.of(context).size.height,
        //           fit: BoxFit.cover,
        //         )),

        //     Flexible(
        //         child: Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Container(
        //         padding: const EdgeInsetsDirectional.only(
        //             bottom: 5, end: 5, start: 20),
        //         decoration: const BoxDecoration(
        //             borderRadius: BorderRadius.only(
        //                 topLeft: Radius.circular(20),
        //                 topRight: Radius.circular(20)),
        //             color: Colors.white),
        //         width: double.infinity,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Align(
        //               alignment: Alignment.topRight,
        //               child: Container(
        //                 margin:
        //                     const EdgeInsetsDirectional.only(end: 10, top: 20),
        //                 decoration: BoxDecoration(
        //                     shape: BoxShape.circle, border: Border.all()),
        //                 width: 45,
        //                 height: 45,
        //                 padding: const EdgeInsets.only(bottom: 5),
        //                 child: CircleAvatar(
        //                   radius: 25,
        //                   backgroundColor: Colors.green,
        //                   child: IconButton(
        //                     icon: const Icon(
        //                       EneftyIcons.tick_circle_outline,
        //                     ),
        //                     onPressed: () {},
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               'you wanna add this photo to a category?',
        //               style: TextStyle(
        //                 color: Colors.black45,
        //                 fontSize: 15,
        //               ),
        //             ),
        //             const SizedBox(
        //               height: 10,
        //             ),
        //             Wrap(
        //               children: categories
        //                   .map(
        //                     (e) => Container(
        //                       margin: const EdgeInsetsDirectional.only(end: 5),
        //                       decoration: BoxDecoration(
        //                           border: Border.all(
        //                             color: Colors.black26,
        //                           ),
        //                           borderRadius: BorderRadius.circular(20)),
        //                       padding: const EdgeInsets.symmetric(
        //                           vertical: 5, horizontal: 10),
        //                       child: Text(
        //                         e,
        //                         style: const TextStyle(
        //                           color: Colors.black45,
        //                         ),
        //                       ),
        //                     ),
        //                   )
        //                   .toList(),
        //             ),
        //             ElevatedButton(
        //               style: ButtonStyle(
        //                   elevation: WidgetStatePropertyAll(0),
        //                   shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(20),
        //                       side: BorderSide(color: Colors.black26))),
        //                   backgroundColor:
        //                       WidgetStatePropertyAll(Colors.white)),
        //               onPressed: () {},
        //               child: const Row(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   Icon(
        //                     EneftyIcons.add_circle_outline,
        //                     color: Colors.black45,
        //                   ),
        //                   SizedBox(
        //                     width: 5,
        //                   ),
        //                   Text(
        //                     'add category',
        //                     style:
        //                         TextStyle(fontSize: 14, color: Colors.black45),
        //                   ),
        //                 ],
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     )),
        //   ],
        // )
        );
  }
}
