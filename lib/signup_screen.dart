import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notepad_app/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();
  
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void SignUp() async{
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

      Navigator.pop(context);


    }catch (error) {
      print("Registration failed: $error");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo or Image
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person_add_outlined,
                          size: 35,
                          color: Color(0xFF6A11CB),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Welcome Text
                    Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sign up to get started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Form
                    Column(
                      children: [
                        // Username Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: userController,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.white70),
                              prefixIcon: Icon(
                                Icons.alternate_email,
                                color: Colors.white70,
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 10),
                        // Full Name Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Full Name',
                              hintStyle: TextStyle(color: Colors.white70),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.white70,
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Email Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.white70),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white70,
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                            ),
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Password Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: passController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white70),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.white70,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Confirm Password Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: cPassController,
                            obscureText: !_isConfirmPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(color: Colors.white70),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.white70,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isConfirmPasswordVisible
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordVisible =
                                        !_isConfirmPasswordVisible;
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),


                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              SignUp();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Color(0xFF6A11CB),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 8,
                              shadowColor: Colors.black.withOpacity(0.4),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Social Signup
                        Text(
                          'Or sign up with',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Login option
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          size: 35,
          color: color,
        ),
      ),
    );
  }
}
