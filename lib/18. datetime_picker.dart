import 'package:flutter/material.dart';

class FlutterDateTimePicker extends StatelessWidget {
  static const String path = "/datatime";
  const FlutterDateTimePicker({super.key});

  Future<void> _selectDate(inContext) async {
    DateTime? selectedDate = await showDatePicker(
      context: inContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017),
      lastDate: DateTime(2023),
    );
    debugPrint(selectedDate.toString());
  }

  Future<void> _selectTime(inContext) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: inContext,
      initialTime: TimeOfDay.now(),
    );
    debugPrint(selectedTime.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DateTime Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Test DatePicker"),
              onPressed: () => _selectDate(context),
            ),
            ElevatedButton(
              child: Text("Test TimePicker"),
              onPressed: () => _selectTime(context),
            )
          ],
        ),
      ),
    );
  }
}
