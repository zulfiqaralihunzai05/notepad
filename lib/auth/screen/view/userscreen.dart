import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});
//Controller
  Future<List<User>> fetchUsers() async {
    final data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (data.statusCode == 200) {
      List<dynamic> list = jsonDecode(data.body);
      return list.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Data Not founded');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Users')),
      body: FutureBuilder<List<User>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'ID: ${users[index].id}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        users[index].name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),

                      Text(
                        users[index].username,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        users[index].email,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
