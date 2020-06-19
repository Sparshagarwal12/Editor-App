import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image/Edits/addText.dart';

void bottomsheetmod(context,file) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(color: Colors.pink),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddText(imageFile: file)),
                        );
                        Fluttertoast.showToast(
                            msg: "Text Widget Clicked",
                            toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.text_format,
                            size: 40,
                          ),
                          Text("Add Text")
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "Text Widget Clicked",
                            toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.text_format,
                            size: 40,
                          ),
                          Text("Add Text")
                        ],
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              )
            ],
          ),
        );
      });
}
