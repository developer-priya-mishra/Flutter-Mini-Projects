import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  static const String path = "/form-widget";
  const FormWidget({Key? key}) : super(key: key);
  @override
  State<FormWidget> createState() => _FormWidget();
}

class _FormWidget extends State<FormWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == "") {
                    return "Field is required";
                  }
                  return null;
                },
                onSaved: (value) {
                  debugPrint("Name field is saved");
                },
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                  //border: InputBorder.none,
                  hintText: "Write your full name",
                  prefixIcon: Icon(Icons.person_rounded),
                  // suffixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
                // maxLength: 15,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.length < 3) {
                    return "Password should more than 3 character";
                  }
                  return null;
                },
                onSaved: (value) {
                  debugPrint("Password field is saved");
                },
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  helperText: "Password > 3 character",
                  prefixIcon: Icon(Icons.password_rounded),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate() == true) {
                      _formkey.currentState!.save();
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => AlertDialog(
                      //     title: Text("Thank You"),
                      //     content: Text("Form submitted successfully"),
                      //     actions: [
                      //       ElevatedButton(
                      //         onPressed: () {
                      //           Navigator.pop(context);
                      //         },
                      //         child: Text("Okay"),
                      //       )
                      //     ],
                      //     backgroundColor: Colors.green.shade100,
                      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      //   ),
                      // );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Form submitted successfully"),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 5),
                        ),
                      );
                      debugPrint("Form Submitted successfully");
                    }
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
