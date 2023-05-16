import 'package:flutter/material.dart';

class FlutterStepper extends StatefulWidget {
  static const String path = "/stepper";
  const FlutterStepper({super.key});

  @override
  State<FlutterStepper> createState() => _FlutterStepperState();
}

class _FlutterStepperState extends State<FlutterStepper> {
  var _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stepper")),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: _currentStep < 2 ? () => setState(() => _currentStep += 1) : null,
        onStepCancel: _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
        steps: const [
          Step(
            title: Text("Get Ready"),
            isActive: true,
            content: Text("Let's begin..."),
          ),
          Step(
            title: Text("Get Set"),
            isActive: true,
            content: Text("Ok, just a little more..."),
          ),
          Step(
            title: Text("Go!"),
            isActive: true,
            content: Text("And, we're done!"),
          )
        ],
      ),
    );
  }
}
