import 'package:flutter/material.dart';

class LoginScreen2 extends StatefulWidget {
  static const String path = "/login-screen-2";
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _welcomeString = "";

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      } else {
        _welcomeString = "";
      }
    });
  }

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
      _welcomeString = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Screen 2"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Image.asset(
              'assets/images/face.jpg',
              width: 90.0,
              height: 90.0,
            ),
            Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      icon: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  Padding(padding: EdgeInsets.all(10.5)),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: ElevatedButton(
                            onPressed: _showWelcome,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 120.0),
                          child: ElevatedButton(
                            onPressed: _erase,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                            ),
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(14.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _welcomeString.isEmpty ? "" : "Welcome, $_welcomeString",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
