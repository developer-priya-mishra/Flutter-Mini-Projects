import 'package:flutter/material.dart';
import 'contact_us.dart';
import 'home.dart';

// add these two properties in material app
// initialRoute: '/',
// onGenerateRoute: RouteGenerator.generateRoute,
// remove route property if there
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case ContactUs.path:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ContactUs(
              name: args,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('Something went wrong.'),
          ),
        );
      },
    );
  }
}
