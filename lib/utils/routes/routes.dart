import 'package:flutter/material.dart';
import 'package:flutter_base_setup/screens/home_screen.dart';
//import 'package:flutter_base_setup/screens/movie_details_screen.dart';
import 'package:flutter_base_setup/screens/splash_screen.dart';
import 'package:flutter_base_setup/utils/routes/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash_screen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),);
          
      case RoutesName.home_screen:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),);
          /*
      case RoutesName.movie_details_screen:
        return MaterialPageRoute(
          builder: (BuildContext context) => MovieDetailsScreen(),);
          */
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text("No route found"),
            ),
          ),);
    }
  }
}