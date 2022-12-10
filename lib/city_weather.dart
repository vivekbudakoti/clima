import 'package:clima/model/model.dart';
import 'package:clima/servies/functions.dart';
import 'package:flutter/material.dart';

class CityWeather extends StatelessWidget {
  final WeatherData weatherData;
  const CityWeather({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                width: double.infinity,
                height: 220,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        "${getWeatherIcon(weatherData.statusid)} ${weatherData.temp.toStringAsFixed(0)}°C ",
                        style: const TextStyle(fontSize: 50),
                      ),
                    ),
                    Text(weatherData.status),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("🌡️: "),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                            "Max: ${weatherData.maxtemp.toStringAsFixed(2)}°C"),
                        const SizedBox(
                          width: 2,
                        ),
                        const Text("||"),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                            "Min: ${weatherData.mintemp.toStringAsFixed(2)}°C"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("☀️: "),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                            "Rise: ${getTime(weatherData.sunrise).toString()}"),
                        const SizedBox(
                          width: 2,
                        ),
                        const Text("||"),
                        const SizedBox(
                          width: 2,
                        ),
                        Text("Set: ${getTime(weatherData.sunset).toString()}"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Wind: ${weatherData.wind} m/s"),
                        const SizedBox(
                          width: 2,
                        ),
                        const Text("||"),
                        const SizedBox(
                          width: 2,
                        ),
                        Text("Pressure: ${weatherData.pressure} mbar"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go Back"),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
