

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
        GetPage(name: "/screen3", page: ()=>CounterExample()),
        GetPage(name: "/screen4", page: ()=> favouriteScreen()),
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
                 SizedBox(height: height/30,),
                 InkWell(
                   onTap: (){
                     Get.toNamed('/screen3');
                   },
                   child: Container(
                     height: height/20,
                     width: width/2,
                     child: Center(child: Text('State Managment GetX')),
                     decoration: BoxDecoration(
                       color: Colors.brown,
                     ),

                   ),
                 ),
                 SizedBox(height: height/30,),
                 InkWell(
                   onTap: (){
                     Get.toNamed('/screen4');
                   },
                   child: Container(
                     height: height/20,
                     width: width/2,
                     child: Center(child: Text('Favourite app GetX')),
                     decoration: BoxDecoration(
                       color: Colors.orangeAccent,
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







//favourite app state managment

class favouriteScreen extends StatefulWidget {
  const favouriteScreen({super.key});

  @override
  State<favouriteScreen> createState() => _favouriteScreenState();
}

//favourite screen cart
class _favouriteScreenState extends State<favouriteScreen> {
  List<cartStructure> listOfthings = [
    cartStructure("Hoddie", "22"  ,false),
    cartStructure("cap", "2" ,false),
    cartStructure("shirt", "23", false),
    cartStructure("pent", "12" , false),
    cartStructure("trouser", "122",false),

  ];
  List<cartStructure> cart=[];
  
  final FavouriteScreenGetX _favouriteScreenGetX = Get.put(FavouriteScreenGetX());

  @override
  Widget build(BuildContext context) {

    final  height  = MediaQuery.of(context).size.height;
    final width =  MediaQuery.of(context).size.width;
    print('Build favoutire');
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: height/10,),
              Text('List'),
              Obx(() =>  Container(
                  height: height/2,
                  width: width,
                  //color: Colors.orangeAccent,
                  child: ListView.builder(
                    itemCount: _favouriteScreenGetX.listOfthings.length,
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: (){
                            _favouriteScreenGetX.makeFavourite(_favouriteScreenGetX.listOfthings[index], index);
                          },
                          child: ListTile(
                            title: Text(_favouriteScreenGetX.listOfthings[index].name),
                            subtitle: Text(_favouriteScreenGetX.listOfthings[index].price),
                            trailing: Icon(Icons.favorite_border),
                          ));
                    },
                  )
              ),),
              SizedBox(height: height/10,),
             Text('Cart'),
             Obx(() =>  Container(
               height: height/3,
               width: width,
               //color: Colors.orangeAccent,
               child: ListView.builder(
                 itemCount: _favouriteScreenGetX.cartList.length,
                 itemBuilder: (context,index){
                   return InkWell(
                       onTap: (){
                         _favouriteScreenGetX.makeUnFavourite(_favouriteScreenGetX.cartList[index], index);
                       },
                       child : ListTile(
                         title: Text(_favouriteScreenGetX.cartList[index].name),
                         subtitle: Text(_favouriteScreenGetX.cartList[index].price),
                         trailing: Icon(Icons.favorite),
                       )
                   );
                 },
               ),
             ),)
            ],
          ),
        ),
      ),
    );
  }
}

class cartStructure{

  String name ;
  String price ;
  bool isFavourite;

  cartStructure(this.name , this.price ,this.isFavourite);

}

class FavouriteScreenGetX extends GetxController{
  RxList cartList = [].obs;
  RxList listOfthings = [
    cartStructure("Hoddie", "22"  ,false),
    cartStructure("cap", "2" ,false),
    cartStructure("shirt", "23", false),
    cartStructure("pent", "12" , false),
    cartStructure("trouser", "122",false),

  ].obs;

  makeFavourite(cartStructure , int index){
    cartList.add(cartStructure);
    listOfthings.removeAt(index);
  }
  makeUnFavourite(cartStructure , int index){
    listOfthings.add(cartStructure);
    cartList.removeAt(index);
  }



}







//state managment
class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}
class _CounterExampleState extends State<CounterExample> {


  final CounterController counterController = Get.put(CounterController());

  int counter = 0 ;
  @override
  Widget build(BuildContext context) {
    print('Build state managment class');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    counterController.decrementNum();
                  },
                  child: Text("-" , style: TextStyle(
                      fontSize: 30
                  ),)
                ),
                Obx((){
                  //print('OBX Build only');
                  return Text("${counterController.counter.toString()} \n ${counterController.dount.toString()}"  , style: TextStyle(
                      fontSize: 30
                  ),);
                }),
                InkWell(
                  onTap: (){
                    counterController.increaseNum();
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
           Obx(() =>  Container(
             height: Get.height/10,
             width: counterController.opacity.value,
             decoration: BoxDecoration(
               color: Colors.blue
                   //.withOpacity(counterController.opacity.value-(counterController.opacity.value-0.9)),
             ),

           ) ,),
           Obx(() =>  Slider(
               value: counterController.opacity.value ,
               min: 1,
               max: 30,
               divisions: 20,
               activeColor: Colors.green,
               inactiveColor: Colors.orange,
               label: 'Set volume value',
               onChanged: (double newValue) {
                 counterController.setNewOpacity(newValue);
               },
               semanticFormatterCallback: (double newValue) {
                 return '${newValue.round()} dollars';
               }
           ),),
            Obx(()=> Transform.scale(
                scale: 2,
                child: Switch(
                  onChanged: (value){
                   // print('Toogle');
                    counterController.setNewToggle(value);
                  },
                  value: counterController.toggle.value,
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.yellow,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.orange,
                )
            )),
            //Text('$textValue', style: TextStyle(fontSize: 20),)
          ],
        )
      ),

    );

  }
}
class CounterController extends GetxController{


  RxInt counter = 0.obs ;
  RxInt dount = 1.obs;
  RxDouble opacity = 1.00.obs;
  RxBool toggle  = false.obs;


  setNewToggle(bool value){
    toggle.value = value;
  }

  setNewOpacity(double x){
    opacity.value = x;
  }


  increaseNum(){
    counter++;
    dount--;
  }

  decrementNum(){
    counter--;
    dount++;
  }


}



//localization
class LocalizationScreen extends StatelessWidget {
  const LocalizationScreen({super.key});

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

