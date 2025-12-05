import 'package:flutter/material.dart';

class DatastorePage extends StatefulWidget {
  const DatastorePage({super.key});

  @override
  State<DatastorePage> createState() => _DatastorePageState();
}

class _DatastorePageState extends State<DatastorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('data store page')
        ],
      ),
    );
  }
}