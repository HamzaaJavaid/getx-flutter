import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Language/language_file.dart';


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
        GetPage(name: "/screen1", page: ()=>GetScreen_1()),
        GetPage(name: "/screen2", page: ()=>LocalizationScreen()),
      ],
      locale: Locale("en" ,"US"),
      translations: languages(),
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
                 SizedBox(height: height/30,),
                 InkWell(
                   onTap: (){

                     Get.toNamed("/screen2");
                   },
                   child: Container(
                     height: height/20,
                     width: width/2,
                     child: Center(child: Text('Localization GetX')),
                     decoration: BoxDecoration(
                       color: Colors.red,
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




class LocalizationScreen extends StatefulWidget {
  const LocalizationScreen({super.key});

  @override
  State<LocalizationScreen> createState() => _LocalizationScreenState();
}

class _LocalizationScreenState extends State<LocalizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Name'.tr),
            Text('Age'.tr),
            Text('Hamza Javaid'.tr),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){
                 Get.updateLocale(Locale("en" ,"US"));
                }, child: Text('English')),
                TextButton(onPressed: (){
                  Get.updateLocale(Locale("ur" ,"PK"));
                }, child: Text('Urdu')),
                TextButton(onPressed: (){
                  Get.updateLocale(Locale("fr" ,"FN"));
                }, child: Text('French'))
              ],
            )
          ],
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

