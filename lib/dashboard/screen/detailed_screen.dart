import 'package:flutter/material.dart';
class DetailedScreen extends StatelessWidget {
  final Map<dynamic, dynamic> data;

  const DetailedScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 30),
          Image.network('https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQd1kWKsODGmz1P44kiLTfpeIOkaemYITnaRVOZEn372xCyrpNoQQ_dMDAV4dWLpVTDFekNEtlkJaDnhlTzoQWdNg'),
          Row(
            children: [
              Text('Username'),
              Text(data['username'], style: TextStyle(fontSize: 20),),
            ],
          ),

          Row(
            children: [
              Text('Name'),
              Text(data['name'], style: TextStyle(fontSize: 20),)
            ],
          ),

          Row(
            children: [
              Text('email'),
              Text(data['email'], style: TextStyle(fontSize: 20),)
            ],
          ),

          Row(
            children: [
              Text('uid'),
              Text(data['uid'], style: TextStyle(fontSize: 13),)
            ],
          ),
        ],
      ),
    );
  }
}
