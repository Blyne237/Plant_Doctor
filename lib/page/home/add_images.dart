import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/page/home/util/image_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/rounded_button_in_app.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  void deleteTile(index) {
    setState(() {
      imageFileList!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Images'),
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButton: imageFileList!.length < 5
          ? FloatingActionButton(
              onPressed: selectImages,
              backgroundColor: kPrimaryColor,
              child: const Icon(Icons.add),
            )
          : RoundedButtonInApp(
            text: 'Submit',
            press: selectImages,
            ),
      body: imageFileList!.isNotEmpty
          ? Stack(
              children: [
                ListView.builder(
                  itemCount: imageFileList!.length,
                  itemBuilder: (context, int index) {
                    return ImageTile(
                      image: File(imageFileList![index].path),
                      deleteFunction: (context) => deleteTile(index),
                    );
                  },
                ),
              ],
            )
          : Image.asset('assets/images/Add files.gif'),
    );
  }
}
