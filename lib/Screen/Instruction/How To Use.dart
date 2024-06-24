import 'package:flutter/material.dart';

import '../Camera/Camera UI.dart';



class HowToUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF130F26),
      appBar: AppBar(
        title: Text('How it works'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple[100],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Open the camera",
                  ),
                  Text(
                    " and take a photo to translate",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImagePickerDemo()),
                );
              },
              child: Text('Open Camera'),
            ),
          ],
        ),
      ),
    );
  }
}