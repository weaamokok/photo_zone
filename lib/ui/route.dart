import 'package:go_router/go_router.dart';
import 'package:photo_zone/domain_model/hive_image_model.dart';
import 'package:photo_zone/feature/gallery_layout/src/galler_layout_composer.dart';
import 'package:photo_zone/feature/gallery_layout/src/view_photo_composer.dart';
import 'package:photo_zone/feature/main_layout/src/main_layout_composer.dart';
import 'package:photo_zone/feature/photo/photo_maker.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainLayoutComposer.makeMainLayoutPage(),
    ),
    GoRoute(
      path: '/gallery',
      name: 'gallery',
      builder: (context, state) =>
          GalleryComposer.makeGallery(categoryId: state.extra as int?),
    ),
    GoRoute(
      path: '/photo',
      name: 'photo',
      builder: (context, state) {
        final extras = state.extra as PhotoExtra;
        return PhotoMaker.makePhotoPage(
            photoPath: extras.photoPath, photoKey: extras.photo);
      },
    ),
    GoRoute(
        path: '/viewPhoto/:photoIndex',
        name: 'viewPhoto',
        builder: (context, state) {
          final extras = state.extra as List<HivePhoto>;
          return ViewPhotoComposer.makePhoto(
            photos: extras,
            photoIndex: int.parse(state.pathParameters['photoIndex']!),
          );
        }),
  ],
);

class PhotoExtra {
  final String photoPath;
  final int photo;
  PhotoExtra({required this.photoPath, required this.photo});
}
