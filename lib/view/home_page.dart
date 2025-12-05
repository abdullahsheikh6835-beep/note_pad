import 'package:flutter/material.dart';
import 'package:notesapp/components%20folder/custom_field.dart';
import 'package:notesapp/components%20folder/custom_text.dart';
import 'package:notesapp/utils/app_colors.dart';
import 'package:notesapp/view/notes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sacreenheight = MediaQuery.of(context).size.height;
    final sacreenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 158, 158),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: const Color.fromARGB(208, 255, 255, 255),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.note_outlined,
                  color: AppColors.amber,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.note_alt_outlined,
                      color: AppColors.amber,
                    )),
                label: '')
          ]),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(13, 158, 158, 158),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomText(
              text: 'Edit',
              Color: AppColors.amber,
              fontSize: 15,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
            text: 'Folders',
            Color: AppColors.black,
            fontSize: 25,
            fw: FontWeight.w900,
          ),
          Container(
            height: sacreenheight * 0.06,
            width: sacreenwidth * 0.9,
            child: customTextField(
              controller: searchcontroller,
              hint: 'search',
              hintStyle: TextStyle(fontSize: 16),
              suffixicon: Icon(Icons.mic, size: 22),
              prefixicon: Icon(Icons.search, size: 22),
            ),
          ),
          SizedBox(
            height: sacreenheight * 0.017,
          ),
          CustomText(
            text: 'iCloud',
            Color: AppColors.black,
            fontSize: 18,
            fw: FontWeight.bold,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesPage()),
              );
            },
            child: Container(
              height: sacreenheight * 0.06,
              width: sacreenwidth * 0.9,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Row(
                  children: [
                    Icon(Icons.note_outlined, color: AppColors.amber),
                    SizedBox(width: sacreenwidth * 0.03),
                    CustomText(
                        text: 'Notes', Color: AppColors.black, fontSize: 15),
                    Spacer(),
                    CustomText(text: '0', Color: AppColors.black, fontSize: 15),
                    SizedBox(width: sacreenwidth * 0.01),
                    Icon(Icons.arrow_forward_ios_rounded, size: 14),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
