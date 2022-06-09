import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SecondRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT US'),
      ),
      body:SingleChildScrollView(
       child:Container(
         child: Text(
                "We are flutter developers. \n"
                ' We created this app to find the temperature and climatic conditions of a particular place.\n',
             style: Theme.of(context)
             .textTheme
             .caption
             .copyWith(
           fontSize: 15,
           fontWeight:
           FontWeight.bold,
           fontFamily:
           'flutterfonts',
         ),
             )
       )
      ),

    );


  }
}

