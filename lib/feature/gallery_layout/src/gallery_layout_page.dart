import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_zone/feature/gallery_layout/src/logic/cubit/gallery_manager_cubit.dart';

class GalleryLayoutPage extends StatelessWidget {
  const GalleryLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {  
    
    return Scaffold(
      appBar: AppBar(elevation: 0),//hdhdkz
      body: BlocBuilder<GalleryManagerCubit, GalleryManagerState>(
          builder: (context, state) {
        return state.photos.maybeMap(
          failedProcess: (value) => Text('error'),
          emptyPage: (value) => Text('empty'),
          orElse: () => SizedBox.shrink(),
          loading: (value) => const CircularProgressIndicator(),
          loaded: (value) => GridView.builder(
            itemCount: value.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2, crossAxisSpacing: 2, crossAxisCount: 2),
            itemBuilder: (context, index) => Image.file(
              File(value.data[index].photo),
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }
}
