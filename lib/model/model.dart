class WeatherData {
  double temp;
  double maxtemp;
  double mintemp;
  String sunrise;
  String sunset;
  String wind;
  String pressure;
  String status;
  int statusid;

  WeatherData(this.temp, this.maxtemp, this.mintemp, this.sunrise, this.sunset,
      this.wind, this.pressure, this.status, this.statusid);
}

WeatherData weatherdataFromJSON(Map<String, dynamic> data) {
  return WeatherData(
    data['main']['temp'] - 273.0,
    data['main']['temp_max'] - 273.0,
    data['main']['temp_min'] - 273.0,
    data['sys']['sunrise'].toString(),
    data['sys']['sunset'].toString(),
    data['wind']['speed'].toString(),
    data['main']['pressure'].toString(),
    data['weather'][0]['description'],
    data['weather'][0]['id'],
  );
}
