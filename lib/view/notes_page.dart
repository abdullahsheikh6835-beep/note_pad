import 'package:flutter/material.dart';
import 'package:notesapp/components%20folder/custom_field.dart';
import 'package:notesapp/components%20folder/custom_text.dart';
import 'package:notesapp/utils/app_colors.dart';
import 'package:notesapp/view/home_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  TextEditingController firsrtrsearchcontroller = TextEditingController();
  TextEditingController secondsearchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sacreenheight = MediaQuery.of(context).size.height;
    final sacreenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.amber,
                  size: 20,
                )),
            title: CustomText(
                text: 'Folders', Color: AppColors.amber, fontSize: 14),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz_rounded,
                    color: AppColors.amber,
                  ))
            ]),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(
                text: 'Notes',
                Color: AppColors.black,
                fontSize: 25,
                fw: FontWeight.w900,
              ),
              Container(
                height: sacreenheight * 0.06,
                width: sacreenwidth * 0.9,
                child: customTextField(
                  controller: firsrtrsearchcontroller,
                  hint: 'search',
                  hintStyle: TextStyle(fontSize: 16),
                  suffixicon: Icon(Icons.mic, size: 22),
                  prefixicon: Icon(Icons.search, size: 22),
                ),
              ),
              SizedBox(
                height: sacreenheight * 0.03,
              ),
              Container(
                height: sacreenheight * 0.06,
                width: sacreenwidth * 0.9,
                child: customTextField(
                  controller: secondsearchcontroller,
                  hint: 'search',
                  hintStyle: TextStyle(fontSize: 16),
                  suffixicon: Icon(Icons.mic, size: 22),
                  prefixicon: Icon(Icons.search, size: 22),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: 'No Data', Color: AppColors.black, fontSize: 12),
                 
                ],
              ),
            ])));
  }
}
