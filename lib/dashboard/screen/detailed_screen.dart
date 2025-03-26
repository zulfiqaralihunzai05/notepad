import 'package:flutter/material.dart';
class DetailedScreen extends StatelessWidget {
  final Map<dynamic, dynamic> data;

  const DetailedScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network('https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQd1kWKsODGmz1P44kiLTfpeIOkaemYITnaRVOZEn372xCyrpNoQQ_dMDAV4dWLpVTDFekNEtlkJaDnhlTzoQWdNg'),
          Row(
            children: [
              Text('Username'),
              Text(data['username'])
            ],
          ),

          Row(
            children: [
              Text('Name'),
              Text(data['name'])
            ],
          ),

          Row(
            children: [
              Text('email'),
              Text(data['email'])
            ],
          ),

          Row(
            children: [
              Text('uid'),
              Text(data['uid'])
            ],
          ),
        ],
      ),
    );
  }
}
