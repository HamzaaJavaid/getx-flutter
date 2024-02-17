import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('Build');
   final  height  = MediaQuery.of(context).size.height;
  final width =  MediaQuery.of(context).size.width;
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/screen1", page: ()=>GetScreen_1())
      ],
      home: Scaffold(
       body: SafeArea(
         child:SingleChildScrollView(
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 InkWell(
                   onTap: (){
                     Get.snackbar(
                         "Hamza", //title
                         "This is Hamza", //message,
                         //colorText: Colors.orangeAccent,
                         backgroundColor: Colors.orangeAccent.shade100,
                         icon: Icon(Icons.bookmark_add),
                         snackPosition: SnackPosition.TOP
                     );
                   },
                   child: Container(
                     height: height/20,
                     width: width/2,
                     child: Center(child: Text('SnackBar GetX')),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.shade100
                    ),
           
                   ),
                 ),
                 SizedBox(height: height/30,),
                 InkWell(
                   onTap: (){
                     Get.defaultDialog(
                       title: "CONFIRM ",
                       content: Text('Are you sure ?'),
                       cancel: TextButton(onPressed: (){
                         Get.back();
                       }, child: Text('Cancel')),
                       confirm: TextButton(onPressed: (){}, child: Text('Yes')),
                     );
                   },
                   child: Container(
                     height: height/20,
                     width: width/2,
                     child: Center(child: Text('Dialog Box GetX')),
                     decoration: BoxDecoration(
                       color: Colors.lightGreen
                     ),
                   ),
                 ),
                 SizedBox(height: height/30,),
                 InkWell(
                   onTap: (){
                    Get.bottomSheet(
                      Container(
                        height: height/7,
                        width: width/1.2,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('Hello'),
                              subtitle: Text('This is hamza Javaid'),
                            )
                          ],
                        ),
                      )
                    );
                   },
                   child: Container(
                     height: height/20,
                     width: width/2,
                     child: Center(child: Text('BottomSheet  Getx')),
                     decoration: BoxDecoration(
                         color: Colors.amberAccent
                     ),

                   ),
                 ),
                 SizedBox(height: height/30,),
                 InkWell(
                   onTap: (){
                     Get.changeTheme(ThemeData.dark());
                   },
                   child: Container(
                     height: height/20,
                     width: width/2,
                     child: Center(child: Text('Dark Theme GetX')),
                     decoration: BoxDecoration(
                         color: Colors.black12,
                     ),

                   ),
                 ),
                 SizedBox(height: height/30,),
                 InkWell(
                   onTap: (){
                     Get.changeTheme(ThemeData.light());
                   },
                   child: Container(
                     height: height/20,
                     width: width/2,
                     child: Center(child: Text('Light Theme GetX')),
                     decoration: BoxDecoration(
                       color: Colors.blueAccent.shade100,
                     ),

                   ),
                 ),
                 SizedBox(height: height/30,),
                 InkWell(
                   onTap: (){
                     Get.toNamed("/screen1" , arguments: [
                       'Hamza Javaid',
                       "Kara noyan"
                     ]);
                   },
                   child: Container(
                     height: height/20,
                     width: width/2,
                     child: Center(child: Text('Routes GetX')),
                     decoration: BoxDecoration(
                       color: Colors.cyanAccent.shade100,
                     ),

                   ),
                 ),
               ],
             ),
           ),
         ),
       ),
      ),
    );
  }
}

class GetScreen_1 extends StatelessWidget {
  const GetScreen_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1 '),
      ),
      body: Center(
        child: Text('This is Data : ${Get.arguments[0]}   ,  ${Get.arguments[1]} '),
      ),
    );
  }
}

