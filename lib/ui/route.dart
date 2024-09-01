import 'package:go_router/go_router.dart';
import 'package:photo_zone/feature/gallery_layout/src/galler_layout_composer.dart';
import 'package:photo_zone/feature/main_layout/src/main_layout_composer.dart';
import 'package:photo_zone/feature/photo/photo_maker.dart';
import 'package:photo_zone/feature/photo/photo_page.dart';

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
      builder: (context, state) =>
          PhotoMaker.makePhotoPage(photoPath: state.extra as String),
    )
  ],
);
