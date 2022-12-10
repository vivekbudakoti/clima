import 'package:clima/city_weather.dart';
import 'package:clima/model/model.dart';
import 'package:clima/servies/functions.dart';
import 'package:clima/wrongEntry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  final WeatherData weatherData;
  final List<WeatherData> weeklyList;
  final String name;
  const Home(
      {Key? key,
      required this.weatherData,
      required this.weeklyList,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 5, right: 10, top: 10, bottom: 10),
              child: TextFormField(
                  onFieldSubmitted: (value) async {
                    if (value.isNotEmpty) {
                      var data = await getCityWeather(value);
                      if (data != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityWeather(
                              weatherData: weatherdataFromJSON(data));
                        }));
                        controller.clear();
                      } else {
                        // ignore: use_build_context_synchronously
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const WrongEntry();
                        }));
                      }
                    }
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search, color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.black),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "📍 : $name",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
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
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Next 5 Days Report: ",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Expanded(
                child: ListView.builder(
                    itemCount: weeklyList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          const SizedBox(width: 10),
                          Container(
                            width: 200,
                            height: 250,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text(
                                    "${getWeatherIcon(weeklyList[index].statusid)} ${weeklyList[index].temp.toStringAsFixed(0)}°C ",
                                    style: const TextStyle(fontSize: 50),
                                  ),
                                ),
                                Text(weeklyList[index].status),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    "Max: ${weeklyList[index].maxtemp.toStringAsFixed(2)}°C"),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    "Min: ${weeklyList[index].mintemp.toStringAsFixed(2)}°C"),
                                const SizedBox(
                                  height: 5,
                                ),
                                const SizedBox(height: 5),
                                Text("Wind: ${weeklyList[index].wind} m/s"),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    "Pressure: ${weeklyList[index].pressure} mbar"),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
