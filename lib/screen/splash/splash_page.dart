

import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text('Splash',style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
      ),
    );
  }
}
