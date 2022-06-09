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
         child: Text('CONTRIBUTIONS:\n\n'
                "1)Lokesh's contributions: \n"
                ' UI designing             - Designing and modifying the user interface \n'
                'Adding dark theme    	   - Enabling dark theme using get packages \n\n'
                "2)Narasimman's contributions: \n"
                ' Designing about page 	   - Describing about the contributions \n'
                ' Upcoming features    	   - Basic weather map, Historical maps, Air Pollution monitor, Solar Radiation monitor \n'
                ' Other city data	   - shows current temperature of specified 5 cities \n \n'
                "3)Dheepan's contributions: \n"
                ' Developing Home screen   - Fetching weather data from openweathermap using API \n'
                ' Forecast for next 5 days - shows next 5 days temperature in a graph \n'
                ' Modifying icons      	   - changing the icons and background. \n',
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

