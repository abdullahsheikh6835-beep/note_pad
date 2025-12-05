import 'package:flutter/material.dart';
import 'package:notesapp/auth_repo.dart';
import 'package:notesapp/components%20folder/custom_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Create Account",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    customTextField(
                      hint: 'Full Name',
                      controller: fullnameController,
                    ),
                    const SizedBox(height: 15),
                    customTextField(
                      hint: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 15),
                    customTextField(
                      hint: 'Password',
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    customTextField(
                      hint: 'Confirm Password',
                      controller: confirmPasswordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      // width: double.infinity,
                      // child: ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.blue,
                      //     padding: const EdgeInsets.symmetric(vertical: 15),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //   ),
                      //   onPressed: () async {
                      //     if (passwordController.text !=
                      //         confirmPasswordController.text) {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(content: Text("Passwords do not match")),
                      //       );
                      //       return;
                      //     }
                      //     try {
                      //       await AuthRepo().createAccount(
                      //         emailController.text.trim(),
                      //         passwordController.text.trim(),
                      //         fullnameController.text.trim(),
                      //       );
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(
                      //             content:
                      //                 Text("Account created successfully")),
                      //       );
                      //     } catch (e) {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(content: Text("Failed: $e")),
                      //       );
                      //     }
                      //   },
                      //   child: Text(
                      //     "Sign Up",
                      //     style: TextStyle(fontSize: 18, color: Colors.white),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                TextButton(
                  onPressed: () {},
                  child: Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
