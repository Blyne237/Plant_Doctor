import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';
import 'package:unicons/unicons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_button_in_app.dart';

class Analyse extends StatefulWidget {
  const Analyse({super.key});

  @override
  State<Analyse> createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> {
  File? image;
     
  // bool _loading = true;
  // List _predications = [];

  // @override
  // void initState() {
  //   super.initState();
  //   loadmodel();
  // }

  // loadmodel() async {
  //   await Tflite.loadModel(
  //     model: 'assets/models/model_unquant.tflite',
  //     labels: 'assets/modles/labels.txt',
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }

  // detect_image(File image) async {
  //   var prediction = await Tflite.runModelOnImage(
  //     path: image.path,
  //     numResults: 15,
  //     threshold: 0.6,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //   );

  //   setState(() {
  //     _loading = false;
  //     _predications = prediction!;
  //   });
  // }

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

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(UniconsLine.arrow_left, size: 30),
          onPressed: () {},
        ),
        backgroundColor: kPrimaryColor,
        title: const Text('Analyse'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 320.0,
                        height: 320.0,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Image.file(
                                width: double.infinity, height: 280.0, image!),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5.0,
                        child: InkWell(
                          child: const Icon(
                            UniconsLine.times_circle,
                            size: 30,
                            color: Color.fromARGB(255, 177, 177, 177),
                          ),
                          // This is where the _image value sets to null on tap of the red circle icon
                          onTap: () {
                            setState(
                              () {
                                image = null;
                              },
                            );
                          },
                        ),
                      )
                    ],
                  )
                : DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    color: Colors.black,
                    strokeWidth: 1,
                    child: Container(
                      height: 280.0,
                      width: 280.0,
                      color: Colors.transparent,
                      child: Container(
                          decoration: const BoxDecoration(
                              color: backGroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: SizedBox.fromSize(
                            size: const Size(20, 20),
                            child: ClipOval(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: backGroundColor,
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        UniconsLine.focus_add,
                                        color: Colors.grey,
                                      ), // <-- Icon
                                      Text("Add Image"), // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
            const SizedBox(
              height: 60,
            ),
            image != null
                ? SizedBox(
                    height: 280.0,
                    width: 280.0,
                    child: Column(
                      children: const [
                        Text("RESULTS here. Sorry this is a test version we are facing issues with image detection package!"),
                        // Text(_predications[0]['label'].toString().substring(2)),
                        // Text('Confidence: ${_predications[0]['confidence'].toString().substring(2)}'),
                      ],
                    ),
                  )
                : SizedBox(
                    child: Column(children: [
                    RoundedButtonInApp(
                      text: "Galery",
                      press: pickImage,
                    ),
                    RoundedButtonInApp(
                      text: "Camera",
                      press: pickImageC,
                    ),
                  ]))
          ],
        ),
      ),
    );
  }
}
