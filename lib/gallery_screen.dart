import 'package:flutter/material.dart';
import 'package:gallery_task/image_list.dart';
import 'package:gallery_task/image_picker_services.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ImagePickerService _imagePickerService = ImagePickerService();
  List<String> _imagePaths = [];

  Future<void> _pickImages() async {
    final List<String> images = await _imagePickerService.pickImages();
    setState(() {
      _imagePaths = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery App'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: _imagePaths.isEmpty
                ? Center(child: Text('No images selected'))
                : ImageList(imagePaths: _imagePaths),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _pickImages,
              child: const Text('Pick Image'),
            ),
          ),
        ],
      ),
    );
  }
}
