import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:climate/src/model/current_weather_data.dart';
import 'package:climate/src/model/five_days_data.dart';
import 'package:climate/src/ui/home/home_controller.dart';
import 'About us.dart';
import 'Features_in_Future.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      Get.changeTheme(ThemeData.dark());
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      Get.changeTheme(ThemeData.light());
      print('Switch Button is OFF');
    }
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cloud-in-blue-sky.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: SafeArea(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20,),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                                _key.currentState.openDrawer();
                              },
                              child: Container(
                                child:  Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.menu_rounded,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: TextField(
                                  onChanged: (value) => controller.city = value,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textInputAction: TextInputAction.search,
                                  onSubmitted: (value) => controller.updateWeather(),
                                  decoration: InputDecoration(
                                    suffix: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: 'Search'.toUpperCase(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.0, 1.0),
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: OverflowBox(
                            minWidth: 0.0,
                            maxWidth: MediaQuery.of(context).size.width,
                            minHeight: 0.0,
                            maxHeight: (MediaQuery.of(context).size.height / 4),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 15, left: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  (controller.currentWeatherData !=
                                                      null)
                                                      ? '${controller.currentWeatherData.name}'
                                                      .toUpperCase()
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 24,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  DateFormat()
                                                      .add_MMMMEEEEd()
                                                      .format(DateTime.now()),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                    color: Colors.pinkAccent,
                                                    fontSize: 10,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(left: 50),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    (controller.currentWeatherData
                                                        .weather !=
                                                        null)
                                                        ? '${controller.currentWeatherData.weather[0].description}'
                                                        : '',
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontSize: 10,
                                                        fontFamily:
                                                        "flutterfonts"),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    (controller.currentWeatherData
                                                        .main !=
                                                        null)
                                                        ? '${(controller.currentWeatherData.main.temp - 273.15).round().toString()}\u2103'
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2
                                                        .copyWith(
                                                        color:
                                                        Colors.redAccent,
                                                        fontFamily:
                                                        'flutterfonts'),
                                                  ),
                                                  Text(
                                                    (controller.currentWeatherData
                                                        .main !=
                                                        null)
                                                        ? 'min: ${(controller.currentWeatherData.main.tempMin - 273.15).round().toString()} / max: ${(controller.currentWeatherData.main.tempMax - 273.15).round().toString()}'
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 15,
                                                      fontFamily:
                                                      'flutterfonts',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(right: 20),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/sun.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      (controller.currentWeatherData
                                                          .wind !=
                                                          null)
                                                          ? 'wind ${controller.currentWeatherData.wind.speed} m/s'
                                                          : '',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption
                                                          .copyWith(
                                                        color:
                                                        Colors.black45,
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontFamily:
                                                        'flutterfonts',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: EdgeInsets.only(top: 120),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'other city'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                  fontSize: 16,
                                  fontFamily: 'flutterfonts',
                                  color: Color.fromARGB(255, 59, 211, 231),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 150,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    VerticalDivider(
                                      color: Colors.transparent,
                                      width: 5,
                                    ),
                                itemCount: controller.dataList.length,
                                itemBuilder: (context, index) {
                                  CurrentWeatherData data;
                                  (controller.dataList.length > 0)
                                      ? data = controller.dataList[index]
                                      : data = null;
                                  return Container(
                                    width: 130,
                                    height: 120,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              (data != null)
                                                  ? '${data.name}'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                                fontFamily: 'flutterfonts',
                                              ),
                                            ),
                                            Text(
                                              (data != null)
                                                  ? '${(data.main.temp - 273.15).round().toString()}\u2103'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    202, 234, 70, 216),
                                                fontFamily: 'flutterfonts',
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/sun.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              (data != null)
                                                  ? '${data.weather[0].description}'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                color: Colors.lightGreen,
                                                fontFamily: 'flutterfonts',
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'forcast next 5 days'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 59, 211, 231),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  series: <ChartSeries<FiveDayData, String>>[
                                    SplineSeries<FiveDayData, String>(
                                      dataSource: controller.fiveDaysData,
                                      xValueMapper: (FiveDayData f, _) =>
                                      f.dateTime,
                                      yValueMapper: (FiveDayData f, _) =>
                                      f.temp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/settings_icon.gif'),
                  fit: BoxFit.cover,
                ),),
              child: Text('Settings'),
            ),
            ListTile(
              title: const Text('Theme'),
              trailing: Switch(
                onChanged: toggleSwitch,
                value: isSwitched,
                activeColor: Colors.blue,
                activeTrackColor: Colors.yellow,
                inactiveThumbColor: Colors.redAccent,
                inactiveTrackColor: Colors.orange,
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              title: const Text('Features In Future'),
              onTap: () {

                Navigator.push(context,MaterialPageRoute(builder: (context) => FirstRoute()),
                );
              },
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {

                Navigator.push(context,MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
