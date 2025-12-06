import 'package:flutter/material.dart';
import 'package:notesapp/auth_repo.dart';
import 'package:notesapp/components%20folder/custom_field.dart';
import 'package:notesapp/components%20folder/custom_text.dart';
import 'package:notesapp/dashbord_page.dart';
import 'package:notesapp/utils/app_colors.dart';

class Folderscreen extends StatefulWidget {
  Folderscreen({super.key});

  @override
  State<Folderscreen> createState() => _FolderscreenState();
}

class _FolderscreenState extends State<Folderscreen> {
  TextEditingController textcontroler = TextEditingController();

  TextEditingController notescontroler = TextEditingController();

  TextEditingController taskcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  text: 'Folders adding', Color: AppColors.black, fontSize: 18),
              SizedBox(height: 10),
              customTextField(hint: 'search', controller: SearchController()),
              SizedBox(height: 10),
              customTextField(hint: 'All task', controller: notescontroler),
              SizedBox(height: 10),
              customTextField(
                hint: 'New add task',
                controller: taskcontroler,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboardscreen()));
                    try {
                      await Auth().creatNotes(
                        textcontroler.text,
                        taskcontroler.text,
                        notescontroler.text,
                      );

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("add task")));
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("$e")));
                    }
                  },
                  child: Text(
                    "ADD Folders",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
