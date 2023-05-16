import 'package:flutter/material.dart';

class PlanetX extends StatefulWidget {
  static const String path = "/planetx";
  const PlanetX({super.key});

  @override
  State<PlanetX> createState() => _PlanetXState();
}

class _PlanetXState extends State<PlanetX> {
  final TextEditingController _weightController = TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;
  String _planetName = "";

  double calculateWeight(String weight, double multiplier) {
    try {
      if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
        return int.parse(weight) * multiplier;
      } else {
        debugPrint("Wrong!");
        return int.parse("180") * 0.38;
      }
    } catch (e) {
      debugPrint("Wrong!");
      return int.parse("180") * 0.38;
    }
  }

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _planetName = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _planetName = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _planetName = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
        default:
          debugPrint("Nothing selected!");
      }
      debugPrint("Value is ${radioValue.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Color.fromRGBO(96, 125, 139, 1),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'assets/images/planet.jpg',
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'In pounds',
                      icon: Icon(Icons.person_outline),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          handleRadioValueChanged(radioValue);
                        }
                      });
                    },
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.brown,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: (value) => handleRadioValueChanged(value!),
                      ),
                      Text(
                        "Pluto",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                        activeColor: Colors.red,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: (value) => handleRadioValueChanged(value!),
                      ),
                      Text(
                        "Mars",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 2,
                        groupValue: radioValue,
                        onChanged: (value) => handleRadioValueChanged(value!),
                      ),
                      Text(
                        "Venus",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(15.0)),
                  Text(
                    _weightController.text.isEmpty ? "Please enter weight" : "$_planetName lbs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
