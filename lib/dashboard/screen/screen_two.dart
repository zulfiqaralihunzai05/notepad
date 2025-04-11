import 'package:flutter/material.dart';

import '../camera_screen.dart';

class ScreenTwo extends StatelessWidget {


  ScreenTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraPage(),));
              },
              child: Text('Open Camera'))

        ],
      ),
    );
  }
}
