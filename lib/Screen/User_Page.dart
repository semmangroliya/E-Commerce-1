import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import '../about.dart';

class USER extends StatefulWidget {
  String fname, lname, email, add, city, phone;

  USER(
      {required this.fname,
      required this.lname,
      required this.email,
      required this.add,
      required this.city,
      required this.phone});

  @override
  State<USER> createState() => USERState();
}

class USERState extends State<USER> {
  String? imageUrl;

  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withAlpha(1),
                  Colors.red.shade100,
                ],
                begin: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      imageUrl != null
                          ? Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 30,
                                horizontal: 30,
                              ),
                              child: CircleAvatar(
                                radius: 83,
                                backgroundColor: Colors.red,
                                child: CircleAvatar(
                                  radius: 80,
                                  backgroundImage: NetworkImage(imageUrl!),
                                ),
                              ),
                            )
                          : Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 30,
                        ),
                        child: CircleAvatar(
                          radius: 83,
                          backgroundColor: Colors.red,
                          child: CircleAvatar(
                            radius: 80,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: mHeight * 0.030,
                        left: mWidth * 0.3,
                        child: RawMaterialButton(
                          elevation: 10,
                          fillColor: Colors.yellow.shade100,
                          child: Icon(Icons.add_a_photo),
                          padding: EdgeInsets.all(15),
                          shape: CircleBorder(),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  title: Text(
                                    "Choose option",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red),
                                  ),
                                  children: [
                                    SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              await uploadcamera();
                                            },
                                            splashColor: Colors.red,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Icon(
                                                    Icons.camera,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                                Text(
                                                  "Camera",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await uploadImage();
                                            },
                                            splashColor: Colors.red,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Icon(
                                                    Icons.photo,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                                Text(
                                                  "Gallery",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    height: mHeight * 0.070,
                    width: mWidth * 1,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.yellow.shade100,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'N a m e :-   ',
                          style: TextStyle(
                              fontSize: mWidth * 0.040, color: Colors.red),
                        ),
                        Text(
                          "${widget.fname}",
                          style: TextStyle(fontSize: mWidth * 0.040),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    height: mHeight * 0.070,
                    width: mWidth * 1,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      color: Colors.yellow.shade100,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'S u r n a m e :-   ',
                          style: TextStyle(
                              fontSize: mWidth * 0.040, color: Colors.red),
                        ),
                        Text(
                          "${widget.lname}",
                          style: TextStyle(fontSize: mWidth * 0.040),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    height: mHeight * 0.070,
                    width: mWidth * 1,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.yellow.shade100,
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            'E m a i l :-   ',
                            style: TextStyle(
                                fontSize: mWidth * 0.040, color: Colors.red),
                          ),
                        ),
                        Container(
                          width: mWidth * 0.5,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "${widget.email}",
                              style: TextStyle(fontSize: mWidth * 0.040),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    height: mHeight * 0.070,
                    width: mWidth * 1,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      color: Colors.yellow.shade100,
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            'A d d r e s s :-   ',
                            style: TextStyle(
                                fontSize: mWidth * 0.040, color: Colors.red),
                          ),
                        ),
                        Container(
                          width: mWidth * 0.5,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                "${widget.add}",
                                style: TextStyle(fontSize: mWidth * 0.040),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    height: mHeight * 0.070,
                    width: mWidth * 1,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.yellow.shade100,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'C i t y :-   ',
                          style: TextStyle(
                              fontSize: mWidth * 0.040, color: Colors.red),
                        ),
                        Text(
                          "${widget.city}",
                          style: TextStyle(fontSize: mWidth * 0.040),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    height: mHeight * 0.070,
                    width: mWidth * 1,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      color: Colors.yellow.shade100,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'C o n t a c t :-   ',
                          style: TextStyle(
                              fontSize: mWidth * 0.040, color: Colors.red),
                        ),
                        Text(
                          "${widget.phone}",
                          style: TextStyle(fontSize: mWidth * 0.040),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.020,
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.center,
                      height: mHeight * 0.070,
                      width: mWidth * 1,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                      child: Text(
                        "ABOUT",
                        style: TextStyle(fontSize: mWidth * 0.040),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ABOUT(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // pickImageFromCamera() async {
  //   XFile? imageData = await imagePicker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     imageFile = File(imageData!.path);
  //   });
  // }
  //
  // pickImageFromGallery() async {
  //   XFile? imageData = await imagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     imageFile = File(imageData!.path);
  //   });
  // }

  uploadImage() async {
    var imageData = await imagePicker.pickImage(source: ImageSource.gallery);
    var imageFile = File(imageData!.path);
    Reference reference = FirebaseStorage.instance.ref().child(widget.fname);
    reference.putFile(imageFile);
    var url = await reference.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  uploadcamera() async {
    var imageData = await imagePicker.pickImage(source: ImageSource.camera);
    var imageFile = File(imageData!.path);
    Reference reference = FirebaseStorage.instance.ref().child(widget.fname);
    reference.putFile(imageFile);
    var url = await reference.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }
}
