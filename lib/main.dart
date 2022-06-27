import 'dart:io';

import 'package:eyepetizer/app_init.dart';
import 'package:eyepetizer/page/video/video_detail_page.dart';
import 'package:eyepetizer/tab_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'http/http_manager.dart';

void main() {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized(); //不加这个强制横/竖屏会报错
  SystemChrome.setPreferredOrientations([
    // 强制竖屏
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  if(Platform.isAndroid){
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

        future: AppInit.init(),
        builder:(BuildContext context, AsyncSnapshot<void> snapshot){
          // HttpManager.getData(
          //   "http://baobab.kaiyanapp.com/api/v2/feed?num=1",
          //   success: (result) {
          //     print(result);
          //   },
          // );
      print("${snapshot.connectionState == ConnectionState.done} ${snapshot.connectionState}");
      var widget = snapshot.connectionState == ConnectionState.done
          ? TabNavigation()
          : Scaffold(
        body: Center(
          // 圈
          child: CircularProgressIndicator(),
        ),
      );

      return GetMaterialAppWidget(child: widget);
    });
  }
}

class GetMaterialAppWidget extends StatefulWidget {
  final Widget child;
  const GetMaterialAppWidget({Key key, this.child}) : super(key: key);

  @override
  _GetMaterialAppWidgetState createState() => _GetMaterialAppWidgetState();
}

class _GetMaterialAppWidgetState extends State<GetMaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'EyePetizer',
    //   initialRoute: '/',
    //   routes: {
    //     '/':(context)=>widget.child
    //   },
    // );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eye',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page:()=>widget.child),
        GetPage(name: '/detail', page: () => VideoDetailPage()),
      ],
    );
  }
}

