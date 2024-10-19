import 'dart:io';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/common/widgets/cirular_icon.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';
import 'package:photo_zone/feature/profile_layout/logic/cubit/profile_cubit.dart';
import 'package:photo_zone/feature/profile_layout/logic/cubit/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final user = state.user
              .maybeMap(
                loaded: (value) => value,
                orElse: () => null,
              )
              ?.data;
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsetsDirectional.only(top: 40, end: 20),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: CircularIcon(
                        icon: const Icon(
                          EneftyIcons.edit_outline,
                        ),
                        onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (_) => BlocProvider<ProfileCubit>.value(
                            value: context.read<ProfileCubit>(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  TextFormField(
                                    decoration: textFieldStyle,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    decoration: textFieldStyle,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    decoration: textFieldStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 130,
                  width: 130,
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xff282828))),
                  child: CircleAvatar(
                    radius: 70,
                    child: user != null ? Image.file(File(user.image)) : null,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      user?.name ?? 'Pretty User',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(user?.userName ?? "@prettyUser"),
                    if (user?.bio != null) Text(user!.bio!),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      color: Color(0xff282828),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child:
                          BlocBuilder<GalleryManagerCubit, GalleryManagerState>(
                        builder: (context, state) {
                          return GridView.builder(
                            shrinkWrap: true,
                            itemCount: state.photos.maybeMap(
                              orElse: () => 0,
                              loaded: (value) => value.data.length,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                    childAspectRatio: .6,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) =>
                                state.photos.maybeMap(
                              orElse: () {},
                              loaded: (value) => Container(
                                padding: const EdgeInsets.only(bottom: 0),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(value.data[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

InputDecoration textFieldStyle = const InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Color(0xff282828))));
