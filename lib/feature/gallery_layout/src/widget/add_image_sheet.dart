import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';
import 'package:photo_zone/feature/home/src/home_page.dart';

class AddImageSheet extends StatelessWidget {
  const AddImageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      child: BlocConsumer<GalleryManagerCubit, GalleryManagerState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = context.read<GalleryManagerCubit>();
          return Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Add Photo',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: double.infinity,
                height: 50,
                child: TextFormField(
                    //TODO this should display categories to select from
                    //  controller: bloc.categoryNameController,
                    decoration: InputDecoration(
                        hintText: 'Category Name..',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 35),
                        hintStyle: const TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff282828)),
                            borderRadius: BorderRadius.circular(25)))),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                itemCount: colors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2, crossAxisCount: 5),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  // bloc.selectFolderColor(
                  //     color: colors[index].toString(),
                  //     index: index),
                  child: Container(
                    height: 5,
                    width: 30,
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 1, left: 1, right: 1),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff282828)),
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                            color:
                                //  state.selectedColorIndex ==
                                //         index
                                //     ? colors[index].withOpacity(.2)
                                //     :
                                colors[index],
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                padding:
                    const EdgeInsets.only(bottom: 5, top: 1, left: 1, right: 1),
                margin: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff282828)),
                    borderRadius: BorderRadius.circular(25)),
                child: InkWell(
                    onTap: () {
                      //   bloc.addCategory();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffffcd69),
                            borderRadius: BorderRadius.circular(25)),
                        width: double.infinity,
                        height: 50,
                        child:
                            // state.isSubmitting
                            //     ? SizedBox(
                            //         width: 20,
                            //         height: 20,
                            //         child:
                            //             const CircularProgressIndicator
                            //                 .adaptive())
                            //     :
                            const Center(child: Text('add')))),
              )
            ],
          );
        },
      ),
    ));
  }
}
