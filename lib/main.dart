

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/sub/subbb.dart';

import 'package:whatsapp/tab/call.dart';
import 'package:whatsapp/tab/community.dart';
import 'package:whatsapp/tab/chat.dart';
import 'package:whatsapp/tab/status.dart';
import 'package:whatsapp/Individual Chat Page/CameraScreen.dart';

import 'model/cameraPage.dart';




 Future<void> main() async {
  runApp(const MyApp());
  cameras =  await availableCameras();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green.shade900,
          appBarTheme:  const AppBarTheme(
              color: Color.fromRGBO(0,128,105,1)
          )
      ),
      home: const Home(),

    ) ;
  }
}



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController tabController;



  @override
  void initState() {
    tabController = new TabController(length: 4, vsync: this) ..addListener(() {setState(( ) {

    });});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          title: const Text("Whats App"),

          actions: [
            IconButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CameraPage()));

            }, icon: Icon(Icons.photo_camera_outlined)),
            IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.search),),
           PopupMenuButton<String>(
               onSelected: (value){
                 print(value);
               },
               itemBuilder: (BuildContext context)
             {
               return[
                 const PopupMenuItem(child: Text("New group"),value:"New group" ,),
                 const PopupMenuItem(child: Text("New broadcast"),value:"New broadcast" ,),
                 const PopupMenuItem(child: Text("Linked device"),value:"Linked device" ,),
                 const PopupMenuItem(child: Text("Starred messages"),value:"Starred messages" ,),
                 const PopupMenuItem(child: Text("Payments"),value:"Payments" ,),
                 const PopupMenuItem(child: Text("Setings"),value:"Setings" ,),
               ];
             }
           )
          ],
          bottom:  TabBar(
            indicatorColor: Colors.white,
            controller: tabController, tabs: [
              Tab(icon: Icon(Icons.groups),),
            Tab(text: 'Chats',),
            Tab(text: 'Updates',),
            Tab(text: 'Calls',)


          ],
          ),
        ),
        body: TabBarView(
            controller: tabController,
            children:  [
              const Community(),
             const Chats(),
             Status(),
             const Call(),
            ]),
        floatingActionButton: tabController.index==0?
        FloatingActionButton(
          onPressed: () {

          },
          backgroundColor: Color.fromRGBO(0,128,105,1),
          child: const Icon((Icons.camera_alt),
          )):
        tabController.index==1?FloatingActionButton(
          onPressed: () {  },
          backgroundColor:  Color.fromRGBO(0,128,105,1),
          child:  const Icon((Icons.message),
      )):tabController.index==2?

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: FloatingActionButton(

                      onPressed: () {  },
                      backgroundColor: Color.fromRGBO(0,128,105,1),
                      child:  const Icon((Icons.edit),
                        color: Colors.white ,
                      )),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FloatingActionButton(
                    onPressed: (){

                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const CameraPage()));
                    },
                    backgroundColor: Color.fromRGBO(0,128,105,1),
                    child:  const Icon((Icons.camera_alt),
                    ))
              ],
            )
            :FloatingActionButton(
            onPressed: () {

            },
            backgroundColor: Color.fromRGBO(0,128,105,1),
            child:  const Icon((Icons.add_call),
            ))
      ),
    );
  }
}





