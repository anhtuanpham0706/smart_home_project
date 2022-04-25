import 'package:flutter/material.dart';




class HomePageUI extends StatelessWidget {
  const HomePageUI({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: Text('hello world'),
      ),
    );
  }
}
