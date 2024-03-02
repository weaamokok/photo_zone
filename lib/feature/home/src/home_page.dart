import 'dart:ffi';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/feature/gallery_layout/src/gallery_layout_page.dart';
import 'package:photo_zone/feature/home/src/cubit/add_category_cubit.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color(0xffffcd69),
                      child: IconButton(
                        icon: const Icon(
                          EneftyIcons.add_outline,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) =>
                                BlocProvider<AddCategoryCubit>.value(
                              value: context.read<AddCategoryCubit>(),
                              child: Container(child: Form(
                                child: BlocBuilder<AddCategoryCubit,
                                    AddCategoryState>(
                                  builder: (context, state) {
                                    final bloc =
                                        context.read<AddCategoryCubit>();
                                    return Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        const Text(
                                          'Add Category',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 50),
                                          width: double.infinity,
                                          height: 50,
                                          child: TextFormField(
                                              controller:
                                                  bloc.categoryNameController,
                                              decoration: InputDecoration(
                                                  hintText: 'Category Name..',
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 35),
                                                  hintStyle: const TextStyle(
                                                      fontSize: 16),
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xff282828)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)))),
                                        ),
                                        const SizedBox(height: 20),
                                        GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: colors.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  childAspectRatio: 2,
                                                  crossAxisCount: 5),
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                            onTap: () => bloc.selectFolderColor(
                                                color: colors[index].toString(),
                                                index: index),
                                            child: Container(
                                              height: 5,
                                              width: 30,
                                              padding: const EdgeInsets.only(
                                                  bottom: 5,
                                                  top: 1,
                                                  left: 1,
                                                  right: 1),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xff282828)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Container(
                                                  width: 30,
                                                  height: 5,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          state.selectedColorIndex ==
                                                                  index
                                                              ? colors[index]
                                                                  .withOpacity(
                                                                      .2)
                                                              : colors[index],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          padding: const EdgeInsets.only(
                                              bottom: 5,
                                              top: 1,
                                              left: 1,
                                              right: 1),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 50),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff282828)),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffffcd69),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  width: double.infinity,
                                                  height: 50,
                                                  child: const Center(
                                                      child: Text('add')))),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        icon: const Icon(
                          EneftyIcons.notification_bing_outline,
                          color: Colors.black,
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
        SizedBox(
          height: 20,
        ),
        Divider(color: Color(0xff282828).withOpacity(.1)),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(EneftyIcons.folder_2_outline,
                    color: Color(0xff282828).withOpacity(.8)),
                SizedBox(
                  width: 10,
                ),
                Text('Your Folders',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Color(0xff282828).withOpacity(.8))),
              ],
            ),
          ),
        ),
        Expanded(
          child: StackedCardCarousel(
              initialOffset: 0,
              spaceBetweenItems: 70,
              items: categories
                  .map(
                    (e) => InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GalleryLayoutPage(),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: colors[categories.indexOf(e)],
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(10))),
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.only(right: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                e,
                                style: TextStyle(
                                    overflow: TextOverflow.fade,
                                    fontSize: 15,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff282828).withOpacity(.8)),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: colors[categories.indexOf(e)],
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )),
                            width: double.infinity,
                            height: 150,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList()),
        )
      ],
    );
  }
}

List<Color> colors = [
  const Color(0xff81689D),
  const Color(0xffBFD8AF),
  const Color(0xffE6A4B4),
  const Color(0xffB7C9F2),
  const Color(0xff9290C3),
];
List<String> categories = [
  'Biology',
  'Math',
  'English',
  'History',
  'Science',
];
