import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: LoadingScreen.routeName,
        routes: {
          LoadingScreen.routeName: (context) => LoadingScreen(),
          //LocationScreen.routeName: (context) => LocationScreen(),
          CityScreen.routeName: (context) => CityScreen()
        },
        onGenerateRoute: (settings) {
          // If you push the PassArguments route
          if (settings.name == LocationScreen.routeName) {
            // Then, extract the required data from the arguments and
            // pass the data to the correct screen.
            return MaterialPageRoute(
                builder: (context) =>
                    LocationScreen(locationWeather: settings.arguments));
          }
          assert(false, 'Need to implement ${settings.name}');
          return null;
        });
  }
}
