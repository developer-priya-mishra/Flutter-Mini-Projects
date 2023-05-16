import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  static const path = '/contact-us';
  final String name;
  const ContactUs({super.key, this.name = ''});

  @override
  Widget build(BuildContext context) {
    String? value = '';
    if (ModalRoute.of(context)!.settings.arguments != null) {
      value = ModalRoute.of(context)!.settings.arguments as String?;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15.0),
            Text("Welcome to contact page: ${name.isEmpty ? value : name}"),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "bye bye...");
              },
              child: Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
