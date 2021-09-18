import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summer_iti_http/model/provider/weather_provider.dart';

// ignore: must_be_immutable
class MyHome1 extends StatelessWidget {
  final String cityName;
  MyHome1(this.cityName);

  @override
  Widget build(BuildContext context) {
    WeathrProvider _weatherProvider = Provider.of<WeathrProvider>(context);
    _weatherProvider.fetchWeather(cityName);
    print(
      cityName,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: Center(
        child: _weatherProvider.weather != null
            ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 30,
                ),
                Text('${_weatherProvider.weather!.location!.name} '),
                Text('${_weatherProvider.weather!.current!.temperature}'),
                Image.network(
                    '${_weatherProvider.weather!.current!.weather_icons![0]}'),
                Text(
                    '${_weatherProvider.weather!.current!.weather_descriptions![0]}'),
              ])
            : Center(
                child: Text('${_weatherProvider.message}'),
              ),
      ),
    );
  }

  /*  void getWeather(String cityName) {
    try {
      ApiServices().getWeather(cityName).then((value) {
        if (value is Weather) _weather = value;
        if (value is WeatherError) _message = value.error!.info;
      });
    } catch (e) {
      _message = e.toString();
    }
  }
} */
}
