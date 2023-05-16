import 'package:flutter/material.dart';
import 'package:learn_flutter/35.%20rest_api_1/services/api_service.dart';
import 'package:learn_flutter/35.%20rest_api_1/screens/product_list.dart';

class LoginScreen extends StatefulWidget {
  static const String path = "/flutter-shop-login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController =
      TextEditingController(text: "mor_2314");
  final TextEditingController passwordController =
      TextEditingController(text: "83r5^_");

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Shop"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (usernameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final getToken = await ApiService().userLogin(
                                usernameController.text,
                                passwordController.text);

                            if (getToken['token'] != null) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Success! your token id ${getToken['token']}"),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }

                              Future.delayed(
                                Duration(seconds: 2),
                                () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductList(),
                                    ),
                                  );
                                },
                              );
                            }
                          } catch (err) {
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Username or Password incorrect"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Enter username and password"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
