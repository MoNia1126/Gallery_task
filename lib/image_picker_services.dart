import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<List<String>> pickImages() async {
    List<String> imagePaths = [];
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null) {
      for (var image in images) {
        imagePaths.add(image.path);
      }
    }
    return imagePaths;
  }
}
