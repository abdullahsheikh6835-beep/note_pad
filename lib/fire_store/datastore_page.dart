import 'package:flutter/material.dart';
import 'package:notesapp/components%20folder/custom_field.dart';
import 'package:notesapp/components%20folder/custom_text.dart';
import 'package:notesapp/fire_store/repo_class.dart';
import 'package:notesapp/utils/app_colors.dart';

class DatastorePage extends StatefulWidget {
  const DatastorePage({super.key});

  @override
  State<DatastorePage> createState() => _DatastorePageState();
}

class _DatastorePageState extends State<DatastorePage> {
  TextEditingController searchcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'data stored page', Color: AppColors.black, fontSize: 18),
      ),
      body: Column(
        children: [
          customTextField(hint: 'search' ,controller:  searchcontroler)   ,
          StreamBuilder(stream: authrepo().streamobj()
          , builder: (context , snapshot){
            if(!snapshot.hasData){
              return Text('no data found');
            } 
             if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if(snapshot.data != null){
                  final data = snapshot.data;
                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder:  (context , index,){
                     return Column(
                      children: [
                          Text('${data?[index]["work"]}'),
                          Text(data?[index]["date"]),
                          Text(data?[index]["day"]),
                          Text(data?[index]["id"]),



                      ],
                     );
                  });
                }return Text('');
                   
          }
          )
        ],
      ),
    );
  }
}