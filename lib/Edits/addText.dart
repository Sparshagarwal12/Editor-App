import 'package:flutter/material.dart';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';

class AddText extends StatefulWidget {
  File imageFile;
  AddText({Key key, @required this.imageFile}) : super(key: key);
  @override
  _AddText createState() => _AddText();
}

List<Color> color = [Color(0xFF89f7fe), Color(0xFF66a6ff)];

TextEditingController _text = TextEditingController();
bool value = false;
bool align = false;
String _selectedLocation;

List<String> dir = ['Top Left', 'Bottom Left'];

class _AddText extends State<AddText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        children: [
          Stack(
            children: [
              // Image.file(widget.imageFile)
              Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(widget.imageFile),
                          fit: BoxFit.cover)),
                  child: Align(
                      alignment: align == false
                          ? Alignment.bottomLeft
                          : Alignment.topLeft,
                      child: Text(
                        _text.text.toString(),
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )))
            ],
          ),
          SizedBox(height: 40),
          Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: _text,
                decoration: InputDecoration(
                  hintText: "Enter the Text",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              )),
          SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: color)),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (value == false) {
                          value = true;
                        } else {
                          value = false;
                          Fluttertoast.showToast(
                              msg: "Not Now", toastLength: Toast.LENGTH_SHORT);
                        }
                      });
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.all(40),
              child: DropdownButton(
                hint: Text(
                    'Please choose Alignment'), // Not necessary for Option 1
                value: _selectedLocation,
                onChanged: (newValue) {
                  if (newValue == dir[0]) {
                    align = true;
                  } else {
                    align = false;
                  }
                  setState(() {
                    _selectedLocation = newValue;
                  });
                },
                items: dir.map((location) {
                  return DropdownMenuItem(
                    child: Text(location),
                    value: location,
                  );
                }).toList(),
              )),
        ],
      ),
    ));
  }
}
