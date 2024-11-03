import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:photo_zone/domain_model/hive_category.dart';

class CategoryTag extends StatelessWidget {
  const CategoryTag({super.key, required this.category});
  final HiveCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 0,
        end: 20,
      ),
      decoration: BoxDecoration(
          color: Color(category.folderColor),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                EneftyIcons.tag_2_outline,
                size: 25,
              )),
          Text(
            category.categoryName ?? '',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
