import 'package:flutter/material.dart';
import 'contact_us.dart';

class Home extends StatelessWidget {
  static const path = '/home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  var result = await Navigator.pushNamed(
                    context,
                    ContactUs.path,
                    arguments: "John", // optional
                  );
                  debugPrint(result.toString());
                },
                child: Text(
                  "Contact Us - using pushNamed with optional parameter",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  var result = await Navigator.pushNamed(
                    context,
                    ContactUs.path,
                    arguments: "Adam", // using route-generator to send required parameter
                  );
                  debugPrint(result.toString());
                },
                child: Text(
                  "Contact Us - using pushNamed with required parameter",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  var result = await Navigator.pushReplacementNamed(
                    context,
                    ContactUs.path,
                    arguments: "Bill",
                  );
                  debugPrint(result.toString());
                },
                child: Text("Contact Us - using pushReplacementNamed"),
              ),
              ElevatedButton(
                onPressed: () async {
                  var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUs(name: "Peter"),
                    ),
                  );
                  debugPrint(result);
                },
                child: Text("Contact Us - using normal push"),
              ),
              ElevatedButton(
                onPressed: () async {
                  var result = await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUs(name: "Elon"),
                    ),
                  );
                  debugPrint(result);
                },
                child: Text("Contact Us - using normal pushReplacement"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
