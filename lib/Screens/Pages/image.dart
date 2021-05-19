import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imageupload extends StatefulWidget {
  @override
  _ImageuploadState createState() => _ImageuploadState();
}

class _ImageuploadState extends State<Imageupload> {
  File sampleImage;
  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      sampleImage = tempImage as File;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(child: Text("jhhh")),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: new Icon(Icons.add),
      ), // Thi
    );
  }
}
