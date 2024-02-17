import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.snackbar(
                "Hamza", //title
                "This is Hamza", //message,
                //colorText: Colors.orangeAccent,
              backgroundColor: Colors.orangeAccent.shade100,
              icon: Icon(Icons.bookmark_add),
              snackPosition: SnackPosition.TOP
            );
          },

        ),
      ),
    );
  }
}
