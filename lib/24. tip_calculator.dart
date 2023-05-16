import 'package:flutter/material.dart';

class TipCalculator extends StatelessWidget {
  static const String path = "/tip-calculator";
  TipCalculator({super.key});

  final TextEditingController billAmount = TextEditingController();
  final TextEditingController tipPercentage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Calculator"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: billAmount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Bill amount(\$)",
              ),
            ),
            TextField(
              controller: tipPercentage,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tip %",
                hintText: "15",
              ),
            ),
            ElevatedButton(
              child: Text("Calculate"),
              onPressed: () {
                try {
                  double calculatedTip =
                      double.parse(billAmount.text) * double.parse(tipPercentage.text) / 100.0;

                  double total = double.parse(billAmount.text) + calculatedTip;

                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: Text(
                        "Tip: \$$calculatedTip \n"
                        "Total: \$$total",
                      ),
                    ),
                  );
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
