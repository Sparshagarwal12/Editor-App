import 'package:flutter/material.dart';
import 'package:image/Edits/addText.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagePick(),
    );
  }
}

List<Color> color = [Color(0xFF89f7fe), Color(0xFF66a6ff)];

class ImagePick extends StatefulWidget {
  @override
  _ImagePick createState() => _ImagePick();
}

class _ImagePick extends State<ImagePick> {
  File galleryFile;
  File cameraFile;

  @override
  Widget build(BuildContext context) {
    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddText(imageFile: cameraFile)),
      );
      print("You selected gallery image : " + galleryFile.path);
      setState(() {});
    }

    imageSelectorCamera() async {
      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        //maxHeight: 50.0,
        //maxWidth: 50.0,
      );
      print("You selected camera image : " + cameraFile.path);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddText(imageFile: cameraFile)),
      );
      setState(() {});
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Image Picker'),
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: color)),
                        child: FlatButton(
                          onPressed: imageSelectorGallery,
                          child: Text(
                            "Get Image From Gallary",
                            style: TextStyle(fontSize: 20),
                          ),
                        )))),
            SizedBox(height: 30),
            Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: color)),
                        child: FlatButton(
                          onPressed: imageSelectorCamera,
                          child: Text(
                            "Get Image From Camera",
                            style: TextStyle(fontSize: 20),
                          ),
                        ))))
          ],
        )));
  }
}
