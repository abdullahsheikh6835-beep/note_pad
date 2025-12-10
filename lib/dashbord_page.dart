import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:notesapp/components%20folder/custom_field.dart';
import 'package:notesapp/fire_store/repo_class.dart';

class text_page extends StatefulWidget {
  const text_page({super.key});

  @override
  State<text_page> createState() => _text_pageState();
}

class _text_pageState extends State<text_page> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController workcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text page',),
      ),
      body:StreamBuilder(stream: authrepo().obj, builder: (context,Snapshot){
        if(Snapshot.hasData){
          return Text('No notes found');
        }
        if(Snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }if(Snapshot.data != null){
          final data = Snapshot.data;
          return ListView.builder(itemCount:data!.length, itemBuilder: (context , index){
                  return Column(
                    children: [
                      Text('${data?[index]}'),
                      Text(data?[index]['name']),
                      Text(data?[index]['work'])

                    ],
                  );
          });
          }return Text('');
      })
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:notesapp/auth_repo.dart';
// import 'package:notesapp/components%20folder/custom_field.dart';
// import 'package:notesapp/components%20folder/custom_text.dart';
// import 'package:notesapp/floder_page.dart';
// import 'package:notesapp/utils/app_colors.dart';

// class Dashboardscreen extends StatefulWidget {
//   Dashboardscreen({super.key, this.userData});

//   Map<String, dynamic>? userData;

//   @override
//   State<Dashboardscreen> createState() => _DashboardscreenState();
// }

// class _DashboardscreenState extends State<Dashboardscreen> {
//   TextEditingController searchcontroler = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Folderscreen()),
//           );
//         },
//       ),
//       appBar: AppBar(
//         leading: TextButton(
//             onPressed: () {},
//             child: IconButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Folderscreen()));
//                 },
//                 icon: Icon(Icons.arrow_back))),
//         title: CustomText(text: 'Notes', Color: AppColors.amber, fontSize: 15),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(height: 10),
//             customTextField(
//               hint: 'search',
//               controller: searchcontroler,
//             ),
//             StreamBuilder(
//               stream: Auth().fetchNotesData(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Text("No Notes found");
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 }
//                 if (snapshot.connectionState == ConnectionState.active) {
//                   if (snapshot.data != null) {
//                     final data = snapshot.data;
//                     return ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: data?.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             Text(" ${data?[index]["Notes"]}"),
//                             Text(data?[index]["Tasks"]),
//                             Text(data?[index]["Text"]),
//                             Text(data?[index]["id"]),
//                           ],
//                         );
//                       },
//                     );
//                   }
//                 }
//                 return Text("");
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
