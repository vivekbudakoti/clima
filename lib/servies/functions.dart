import 'package:clima/model/model.dart';
import 'package:clima/servies/location.dart';
import 'package:clima/servies/network.dart';
import 'package:intl/intl.dart';

Future<dynamic> getCurrentLocationWeather() async {
  Location location = Location();
  await location.getCurrentLoccation();
  var lat = location.latitude;
  var lan = location.longitude;

  NetworkHelper networkHelper = NetworkHelper(
      "https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lan}&appid=df4e7fa66bff1ee14eeeeb2fc17e0034");
  var weatherData = await networkHelper.getData();
  return weatherData;
}

Future<dynamic> getWeeklyRepportData() async {
  Location location = Location();
  await location.getCurrentLoccation();
  var lat = location.latitude;
  var lan = location.longitude;

  NetworkHelper networkHelper = NetworkHelper(
      "https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lan}&appid=df4e7fa66bff1ee14eeeeb2fc17e0034");
  var weeklydata = await networkHelper.getData();

  return weeklydata;
}

Future<dynamic> getCityWeather(String city) async {
  NetworkHelper networkHelper = NetworkHelper(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=df4e7fa66bff1ee14eeeeb2fc17e0034");
  var cityData = await networkHelper.getData();
  return cityData;
}

List<WeatherData> getWeekList(dynamic weekdata) {
  List<WeatherData> ls = [];
  for (var v in weekdata['list']) {
    ls.add(weatherdataFromJSON(v));
  }
  return onlyRequiredWeeklyList(ls);
}

List<WeatherData> onlyRequiredWeeklyList(List<WeatherData> ls) {
  int n = ls.length;
  List<WeatherData> newList = [];
  int i = 0;
  for (i = 0; i < n; i++) {
    if (i % 8 == 0) newList.add(ls[i]);
  }
  return newList;
}

String getTime(String data) {
  var res = DateTime.fromMillisecondsSinceEpoch(int.parse(data) * 1000);
  return DateFormat.Hm().format(res);
}

String getWeatherIcon(int condition) {
  if (condition < 300) {
    return '🌩';
  } else if (condition < 400) {
    return '🌧';
  } else if (condition < 600) {
    return '☔️';
  } else if (condition < 700) {
    return '☃️';
  } else if (condition < 800) {
    return '🌫';
  } else if (condition == 800) {
    return '☀️';
  } else if (condition <= 804) {
    return '☁️';
  } else {
    return '🤷‍';
  }
}
