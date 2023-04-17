import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/page/home/home_screen.dart';
import 'package:flutter_application_blyne_1/page/home/util/image_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../widgets/rounded_button_in_app.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
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

  Future<void> _submit(context) async {
    await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const HomeScreen()));
      Fluttertoast.showToast(
        msg: "Images added",
        backgroundColor: Colors.green[600],
        fontSize: 15.0,
      );
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
              press: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                Fluttertoast.showToast(
                  msg: "Images added",
                  backgroundColor: Colors.green[600],
                  fontSize: 15.0,
                );
              } 
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
