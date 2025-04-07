import 'package:flutter/material.dart';
import 'package:notepad_app/dashboard/screen/screen_two.dart';

class GridViewExample extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple GridView Example'),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(color: Colors.red),
              );
            })

        // GridView.builder(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2, // Number of items per row
        //     crossAxisSpacing: 10, // Space between columns
        //     mainAxisSpacing: 10, // Space between rows
        //   ),
        //   itemCount: items.length,
        //   itemBuilder: (context, index) {
        //     return Card(
        //       color: Colors.blueAccent,
        //       child: Center(
        //         child: Text(
        //           items[index],
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
