import 'package:flutter/material.dart';
import 'package:photo_zone/utils/theme.dart';

class ZoneButton extends StatelessWidget {
  const ZoneButton(
      {super.key,
      required this.child,
      required this.onTap,
      this.isLoading = false});
  final Widget child;
  final bool isLoading;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(bottom: 5, top: 1, left: 1, right: 1),
      margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(25)),
      child: InkWell(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppTheme.appTheme.colorScheme.primaryContainer,
              ),
              width: double.infinity,
              height: 50,
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator.adaptive())
                  : Center(child: child))),
    );
  }
}
