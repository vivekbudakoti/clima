import 'package:clima/home.dart';
import 'package:clima/model/model.dart';
import 'package:clima/servies/functions.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getCurrentLocationData();
    super.initState();
  }

  void getCurrentLocationData() async {
    var weatherData = await getCurrentLocationWeather();
    var weeklyData = await getWeeklyRepportData();
    List<WeatherData> ls = getWeekList(weeklyData);
    // ignore: use_build_context_synchronously

    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Home(
          weatherData: weatherdataFromJSON(weatherData),
          weeklyList: ls,
          name: weatherData['name']);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
