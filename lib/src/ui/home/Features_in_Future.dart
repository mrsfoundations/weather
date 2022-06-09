import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FirstRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPCOMING FEATURES'),
      ),
      body:SingleChildScrollView(
          child:Container(
              child:const Text('1)Basic weather map\n'
                  '2)Geographic map\n'
                  '3)Air Pollution monitor\n'
                  '4)Solar Radiation monitor\n'))),


    );


  }
}