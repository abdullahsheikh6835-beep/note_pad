import 'package:flutter/material.dart';
import 'package:notesapp/components%20folder/custom_field.dart';
import 'package:notesapp/components%20folder/custom_text.dart';
import 'package:notesapp/fire_store/datastore_page.dart';
import 'package:notesapp/fire_store/repo_class.dart';
import 'package:notesapp/utils/app_colors.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController workcontroller = TextEditingController();
    TextEditingController datecontroller = TextEditingController();
    TextEditingController daycontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: 'Your daily shedule', Color: AppColors.black, fontSize: 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTextField(
                  hint: 'your daily work', controller: workcontroller),
              SizedBox(
                height: 30,
              ),
              customTextField(hint: 'Date', controller: datecontroller),
              SizedBox(
                height: 30,
              ),
              customTextField(hint: 'Day', controller: daycontroller),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DatastorePage()));
                    try {
                      await authrepo().creatNotes(workcontroller.text,
                          datecontroller.text as int, daycontroller.text);

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
                    "Add shedule",
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
