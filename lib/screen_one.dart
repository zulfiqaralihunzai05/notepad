import 'package:flutter/material.dart';
import 'package:notepad_app/screen_two.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  TextEditingController testname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Screen One'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextField(
              controller: testname,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white))),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenTwo(name: testname.text.toString() ,),
                    ));
              },
              child: Text(
                'Pass Data',
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
        ],
      ),
    );
  }
}
