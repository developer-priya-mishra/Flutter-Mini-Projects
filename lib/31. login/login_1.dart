import 'package:flutter/material.dart';

class LoginData {
  String username = "";
  String password = "";
}

class LoginScreen1 extends StatefulWidget {
  static const String path = "/login-screen";
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  final LoginData _loginData = LoginData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext inContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen 1"),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (inValue) {
                  if (inValue != null && inValue.isEmpty) {
                    return "Please enter username";
                  }
                  return null;
                },
                onSaved: (inValue) {
                  _loginData.username = inValue!;
                },
                decoration: InputDecoration(
                  hintText: "none@none.com",
                  labelText: "Username (Email address)",
                ),
              ),
              TextFormField(
                obscureText: true,
                validator: (inValue) {
                  if (inValue != null && inValue.length < 10) {
                    return "Password must be >=10 in length";
                  }
                  return null;
                },
                onSaved: (inValue) {
                  _loginData.password = inValue!;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                ),
              ),
              ElevatedButton(
                child: Text("Log In!"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    debugPrint("Username: ${_loginData.username}");
                    debugPrint("Password: ${_loginData.password}");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
