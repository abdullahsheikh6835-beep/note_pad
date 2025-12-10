import 'package:flutter/material.dart';
import 'package:notesapp/components%20folder/custom_field.dart';
import 'package:notesapp/components%20folder/custom_text.dart';
import 'package:notesapp/utils/app_colors.dart';
import 'package:notesapp/view/auth_repo.dart';
import 'package:notesapp/view/floder_page.dart';

class Dashboardscreen extends StatefulWidget {
  Dashboardscreen({super.key, this.userData});

  Map<String, dynamic>? userData;

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  TextEditingController searchcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Folderscreen()),
          );
        },
      ),
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {},
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Folderscreen()));
                },
                icon: Icon(Icons.arrow_back))),
        title: CustomText(text: 'Notes', Color: AppColors.amber, fontSize: 15),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            customTextField(
              hint: 'search',
              controller: searchcontroler,
            ),
            StreamBuilder(
              stream: Auth().fetchNotesData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("No Notes found");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.data != null) {
                    final data = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(" ${data?[index]["Notes"]}"),
                            Text(data?[index]["Tasks"]),
                            Text(data?[index]["Text"]),
                            Text(data?[index]["id"]),
                          ],
                        );
                      },
                    );
                  }
                }
                return Text("");
              },
            ),
          ],
        ),
      ),
    );
  }
}
