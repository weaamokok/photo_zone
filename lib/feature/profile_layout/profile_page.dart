import 'dart:io';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/common/widgets/cirular_icon.dart';
import 'package:photo_zone/common/widgets/zone_button.dart';
import 'package:photo_zone/domain_model/user_model.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';
import 'package:photo_zone/feature/profile_layout/logic/cubit/profile_cubit.dart';
import 'package:photo_zone/feature/profile_layout/logic/cubit/profile_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsetsDirectional.only(top: 10, end: 20),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: CircularIcon(
                  icon: const Icon(
                    EneftyIcons.edit_outline,
                  ),
                  onTap: () => showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    scrollControlDisabledMaxHeightRatio: 0.7,
                    builder: (_) => BlocProvider<ProfileCubit>.value(
                      value: context.read<ProfileCubit>()..fetchUserInfo(),
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          return state.user.maybeMap(
                            emptyPage: (value) => const EditProfile(),
                            orElse: () => const SizedBox.shrink(),
                            loaded: (value) => EditProfile(
                              user: value.data,
                            ),
                            loading: (value) => const Skeletonizer(
                              child: EditProfile(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
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
                    child: user != null && user.image != null
                        ? Image.file(File(user.image ?? ''))
                        : null,
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
                            physics: const NeverScrollableScrollPhysics(),
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

InputDecoration textFieldStyle = InputDecoration(
  contentPadding: const EdgeInsetsDirectional.only(start: 20, top: 20),
  hintStyle: TextStyle(color: const Color(0xff282828).withOpacity(0.5)),
  // enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(20)),
  //     borderSide: BorderSide(color: Color(0xff282828)))
);

class EditProfile extends StatelessWidget {
  const EditProfile({super.key, this.user});
  final UserHive? user;
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController bioController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: nameController,
            decoration: textFieldStyle.copyWith(hintText: 'name'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: userNameController,
            decoration: textFieldStyle.copyWith(hintText: 'user name'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailController,
            decoration: textFieldStyle.copyWith(hintText: 'email'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: bioController,
            maxLines: 3,
            decoration: textFieldStyle.copyWith(
              hintText: 'bio...',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ZoneButton(
            child: const Text('Save'),
            onTap: () {
              if (user != null) {
                
                context.read<ProfileCubit>().updateUserInfo(
                        user: UserHive(
                      id: user!.id,
                      email: emailController.text,
                      userName: userNameController.text,
                      name: nameController.text,
                      bio: bioController.text,
                      createdAt: DateTime.now(),
                    ));
              } else {
                context.read<ProfileCubit>().registertUser(
                        user: UserHive(
                      email: emailController.text,
                      userName: userNameController.text,
                      name: nameController.text,
                      bio: bioController.text,
                      createdAt: DateTime.now(),
                    ));
              }
            },
          )
        ],
      ),
    );
  }
}
