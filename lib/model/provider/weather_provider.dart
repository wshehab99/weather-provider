import 'package:flutter/cupertino.dart';
import 'package:summer_iti_http/data/remote/api_services.dart';
import 'package:summer_iti_http/model/weather.dart';
import 'package:summer_iti_http/model/weather_eror.dart';

class WeathrProvider extends ChangeNotifier {
  Weather? weather;
  String? message;
  void fetchWeather(String cityName) {
    try {
      ApiServices().getWeather(cityName).then((value) {
        if (value is Weather) {
          weather = value;
          notifyListeners();
        }
        if (value is WeatherError) {
          message = value.error!.info;
          notifyListeners();
        }
      });
    } catch (error) {
      message = error.toString();
      notifyListeners();
    }
  }
}
