import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'homescreen.dart';

class ChoseImage extends StatefulWidget {
  const ChoseImage({super.key});

  @override
  State<ChoseImage> createState() => _ChoseImageState();
}

class _ChoseImageState extends State<ChoseImage> {
  late firebase_storage.Reference ref;
  static String selectedImagePath = '';
  static int a = 0;
  static int changeScreen = 0;
  static String text1 = "Click your meal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: changeScreen == 0 ? screen1() : screen2(),
    );
  }

  // top screen
  screen1() {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15.0, bottom: 10, left: 1, right: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            topback(),
            middletiger(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              child: a == 0 ? spoonimage() : cameraimage(),
            ),
            message(),
            cameraIcon(),
          ],
        ),
      ),
    );
  }

  screen2() {
    return const Center(
      child: Text(
        "Good Job",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
          color: Colors.green,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

//backbutton
  topback() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 20, right: 8, bottom: 10),
      child: Container(
        alignment: Alignment.topLeft,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(100)),
        child: IconButton(
          onPressed: () {
            // _launcher;
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
        ),
      ),
    );
  }

  //middle port
  middletiger() {
    return Container(
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height / 3.5,
      width: double.infinity,
      child: Center(
          child: Image.asset('img/Capture.PNG',
              width: double.infinity, fit: BoxFit.fitWidth)),
    );
  }

  spoonimage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset('img/spoon.PNG', fit: BoxFit.fitWidth)),
    );
  }

  cameraimage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: Image.file(
            File(selectedImagePath),
            fit: BoxFit.cover,
          ).image,
        ),
      ),
    );
  }

  message() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Center(
        child: Text(
          text1,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  cameraIcon() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(100)),
        child: IconButton(
          onPressed: () async {
            // selectedImagePath = await selectImageFromCamera();
            selectImageFromCamera();
          },
          icon: a == 0
              ? const Icon(Icons.camera_alt, size: 30, color: Colors.white)
              : const Icon(Icons.done, size: 30, color: Colors.white),
        ),
      ),
    );
  }

  void selectImageFromCamera() async {
    selectedImagePath = '';
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    try {
      if (file != null) {
        setState(() {
          selectedImagePath = file.path;
          text1 = "Will you eat this?";
          a = 1;
        });
        uploadimage();
      } else {
        setState(() {
          a = 0;
          text1 = "Click your meal";
          showSnackBar(Colors.red, "No Image Captured !");
          changeScreen = 0;
        });
      }
    } catch (e) {
      showSnackBar(Colors.red, "please retry");
      setState(() {
        a = 0;
        changeScreen = 0;
      });
      print('failed to pick image $e');
    }
  }

  //uploading image to firebase storage
  void uploadimage() async {
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    // Reference ref =
    storageRef
        .child('folder/internmage.jpeg/${DateTime.now().millisecond}')
        .putFile(File(selectedImagePath), metaData)
        .whenComplete(() => {
              showSnackBar(Colors.green, 'Thank you for sharing food with me'),
              Future.delayed(const Duration(milliseconds: 3000), () {
                setState(() {
                  changeScreen = 1;
                });
              }),
              Future.delayed(const Duration(milliseconds: 6000), () {
                Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, a, b) => const Homepage(),
                    ),
                    (route) => false);
              })
            });
  }

//   //notification to users
  void showSnackBar(dynamic color, String text) {
    var snackBar = SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
