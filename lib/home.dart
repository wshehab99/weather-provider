import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summer_iti_http/home1.dart';

import 'model/provider/weather_provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<String> cities = ['New York', 'Cairo', 'San Francisco', 'Almansourah'];
  String city = 'New York';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            reusedDropDown(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChangeNotifierProvider<WeathrProvider>(
                        create: (context) => WeathrProvider(),
                        child: MyHome1(city));
                  }));
                },
                child: Text('go'))
          ],
        ),
      ),
    );
  }

  Widget reusedDropDown() {
    return DropdownButton<String>(
      value: city,
      icon: Icon(Icons.arrow_downward),
      items: cities
          .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          city = value!;
        });
        print(city);
      },
    );
  }
}
