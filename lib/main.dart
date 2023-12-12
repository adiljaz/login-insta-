import 'package:flutter/material.dart';
import 'package:my_first_app/splash.dart';

const SAVE_KEY_NAME='userLogined';



void main(){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login page ',
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),

      home: ScreenSplash(),
    );
  }


}