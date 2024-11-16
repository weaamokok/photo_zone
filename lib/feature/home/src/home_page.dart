import 'package:cached_network_image/cached_network_image.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_zone/common/widgets/cirular_icon.dart';
import 'package:photo_zone/feature/gallery_layout/src/galler_layout_composer.dart';
import 'package:photo_zone/feature/home/src/cubit/add_category_cubit.dart';
import 'package:photo_zone/feature/home/src/widget/add_category_bottomsheet.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import 'cubit/add_category_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCategoryCubit, AddCategoryState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        'https://ratedrnb.com/cdn/2020/06/UMI.v1.png'),
                    radius: 25,
                  ),
                  Row(
                    children: [
                      CircularIcon(
                        icon: const Icon(
                          EneftyIcons.add_outline,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) =>
                                BlocProvider<AddCategoryCubit>.value(
                              value: context.read<AddCategoryCubit>(),
                              child: const AddCategoryBottomSheet(),
                            ),
                          );
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).canvasColor.onColor)),
                        width: 45,
                        height: 45,
                        padding: const EdgeInsets.only(bottom: 5),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: const Icon(
                              EneftyIcons.notification_bing_outline,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          EneftyIcons.folder_2_outline,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Your Folders',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          context.pushNamed('gallery');
                        },
                        child: const Text('view all'))
                  ],
                ),
              ),
            ),
            Expanded(
              child: StackedCardCarousel(
                  initialOffset: 2,
                  spaceBetweenItems: 70,
                  items: state.folders != null
                      ? state.folders!.isEmpty
                          ? categories
                              .map(
                                (e) => InkWell(
                                  // onTap: () => Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => GalleryLayoutPage(),
                                  //     )),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: colors[e.indexOf(e)],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(60),
                                                      topRight:
                                                          Radius.circular(10))),
                                          height: 30,
                                          width: 90,
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              categories[e.indexOf(e)],
                                              style: const TextStyle(
                                                overflow: TextOverflow.fade,
                                                fontSize: 15,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: colors[e.indexOf(e)],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              )),
                                          width: double.infinity,
                                          height: 150,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                          : state.folders!
                              .map(
                                (e) => InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GalleryComposer.makeGallery(
                                                categoryId: e.id),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color(e.folderColor),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(60),
                                                      topRight:
                                                          Radius.circular(10))),
                                          height: 30,
                                          width: 90,
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              e.categoryName,
                                              style: TextStyle(
                                                  overflow: TextOverflow.fade,
                                                  fontSize: 15,
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color(0xff282828)
                                                      .withOpacity(.8)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color(e.folderColor),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              )),
                                          width: double.infinity,
                                          height: 150,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                      : []),
            )
          ],
        );
      },
    );
  }
}

List<Color> colors = [
  const Color.fromARGB(255, 225, 201, 253),
  const Color(0xffBFD8AF),
  const Color(0xffE6A4B4),
  const Color(0xffB7C9F2),
  const Color.fromARGB(255, 209, 208, 244),
];
List<String> categories = [
  'Biology',
  'Math',
  'English',
  'History',
  'Science',
];
