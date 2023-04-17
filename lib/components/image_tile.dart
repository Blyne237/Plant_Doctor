import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class ImageTile extends StatefulWidget {
  final  photoTitle;
  final  images;
  const ImageTile({
    super.key,
    required this.photoTitle,
    required this.images,
  });

  @override
  State<ImageTile> createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);
      // detect_image(imageTemp);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListTile(
          trailing: Container(
            width: 70,
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: pickImage,
                    icon: Icon(Icons.edit),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
