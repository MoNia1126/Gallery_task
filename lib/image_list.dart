import 'dart:io';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  final List<String> imagePaths;

  const ImageList({Key? key, required this.imagePaths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.file(
            File(imagePaths[index]),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        );
      },
    );
  }
}
