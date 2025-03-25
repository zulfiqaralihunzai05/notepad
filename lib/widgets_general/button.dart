import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnTitle;
  const Button({super.key, required this.btnTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(20)
      ),
       child: Text(btnTitle),
    );
  }
}
