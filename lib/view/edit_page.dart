import 'package:flutter/material.dart';
import 'package:notesapp/components%20folder/custom_field.dart';
import 'package:notesapp/components%20folder/custom_text.dart';
import 'package:notesapp/utils/app_colors.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Notes', Color: AppColors.amber, fontSize: 14),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            customTextField(hint: 'email', controller: emailController),
            SizedBox(
              height: 20,
            ),
            customTextField(hint: 'password', controller: passwordController),
            SizedBox(
              height: 20,
            ),
            customTextField(hint: 'full name', controller: fullnameController),
            SizedBox(
              height: 20,
            ),
            // ElevatedButton(
            //     onPressed: () async {
            //       try {
            //         await AuthRepo().createAccount(
            //           emailController.text.trim(),
            //           passwordController.text.trim(),
            //           fullnameController.text.trim(),
            //         );
            //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //           content: Text('Account created successfully'),
            //         ));
            //       } catch (e) {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(content: Text("Failed: $e")),
            //         );
            //       }
            //     },
            //     child: Text('sign up'))
          ],
        ),
      ),
    );
  }
}
