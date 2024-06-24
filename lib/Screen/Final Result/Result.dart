import 'package:flutter/material.dart';
import 'dart:io';

class FinalResult extends StatelessWidget {
  final File? image;

  FinalResult({this.image, required String result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Final Result'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: MediaQuery.of(context).size.width / 2 - 40,
              height: MediaQuery.of(context).size.height / 3 - 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: image == null
                  ? Center(child: Text('No image selected.'))
                  : Image.file(image!, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              width: MediaQuery.of(context).size.width / 2 - 40,
              height: MediaQuery.of(context).size.height / 3 - 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text('No model selected'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}