import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
   String name= 'ahfgdgfd';

   ScreenTwo({
    super.key,
    required this.name,
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
          Center(
              child: Text(
            'My Name is:  $name',
            style: TextStyle(fontSize: 28),
          ))
        ],
      ),
    );
  }
}
