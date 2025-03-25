import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignupController extends GetxController {
  final TextEditingController userController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future SignUp() async{
    try {
      UserCredential data = await
      _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text);

      await _firestore.collection('Students').doc(data.user!.uid).set({
        'name': nameController.text,
        'username':userController.text,
        'email': emailController.text,
        'password': passController.text,
        'uid':data.user!.uid,
      });

     // Navigator.pop(context);


    }catch (error) {
      print("Registration failed: $error");
    }
  }

}