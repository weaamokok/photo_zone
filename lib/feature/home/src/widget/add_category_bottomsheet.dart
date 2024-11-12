import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/common/widgets/zone_button.dart';
import 'package:photo_zone/feature/home/src/cubit/add_category_cubit.dart';
import 'package:photo_zone/feature/home/src/cubit/add_category_state.dart';
import 'package:photo_zone/feature/home/src/home_page.dart';
import 'package:photo_zone/utils/theme.dart';

class AddCategoryBottomSheet extends StatelessWidget {
  const AddCategoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: BlocConsumer<AddCategoryCubit, AddCategoryState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
            // context
            //     .read<AddCategoryCubit>()
            //     .categoryNameController
            //     .dispose();
            context.read<AddCategoryCubit>().fetchFolders();
          }
          if (state.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Error'),
            ));
          }
        },
        builder: (context, state) {
          final bloc = context.read<AddCategoryCubit>();
          return Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Add Category',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: double.infinity,
                height: 50,
                child: TextFormField(
                    controller: bloc.categoryNameController,
                    decoration: InputDecoration(
                        hintText: 'Category Name..',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 35),
                        hintStyle: const TextStyle(fontSize: 16),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(25)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(25)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(25)))),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                itemCount: colors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2, crossAxisCount: 5),
                itemBuilder: (context, index) => InkWell(
                  onTap: () => bloc.selectFolderColor(
                      color: colors[index].toString(), index: index),
                  child: Container(
                    height: 5,
                    width: 30,
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 1, left: 1, right: 1),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                            color: state.selectedColorIndex == index
                                ? colors[index].withOpacity(.2)
                                : colors[index],
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ZoneButton(
                onTap: () {
                  bloc.addCategory();
                },
                isLoading: state.isSubmitting,
                child: const Text('Add'),
              ),
            ],
          );
        },
      ),
    );
  }
}
