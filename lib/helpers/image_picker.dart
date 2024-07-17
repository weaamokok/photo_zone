import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> selectOrTakePhoto(ImageSource imageSource) async {
  final picker = ImagePicker();


  final img = await picker.pickImage(source: imageSource);
  if (img == null) return null;
  return File(img.path);
}
