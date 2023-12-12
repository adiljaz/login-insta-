import 'package:flutter/material.dart';

class Kooi extends StatelessWidget {

  final String name;

  const Kooi({super.key, required this.name});
  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home:Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(child: Text('kjdbchb'),),
          ],
        ),
      ),
    );
  }
}