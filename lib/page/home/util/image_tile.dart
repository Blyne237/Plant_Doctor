import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unicons/unicons.dart';

class ImageTile extends StatefulWidget {
  final File? image;
  Function(BuildContext)? deleteFunction;

  ImageTile({
    super.key,
    required this.image,
    required this.deleteFunction,
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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          height: 100,
          child: Card(
            elevation: 5,
            child: Center(
              child: ListTile(
                leading: Image.file(widget.image!, width: 70,),
                title: const Text(
                  "Photo",
                ),
                trailing: IconButton(
                  onPressed: () {
                    pickImage();
                  },
                  icon: const Icon(UniconsLine.edit),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
