import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GalleryLayoutPage extends StatelessWidget {
  const GalleryLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => CachedNetworkImage(imageUrl: ''),
      ),
    );
  }
}
