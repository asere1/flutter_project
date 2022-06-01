import 'package:flutter/material.dart';

AlertDialog buildAlertDialog(BuildContext context, isMale, result, age) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    contentTextStyle: Theme.of(context).textTheme.headline1,
    title: const Center(
        child: Text(
      'BMI',
      style: TextStyle(fontSize: 25),
    )),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Gender: ${isMale ? 'Male' : 'Female'}"),
        Text("Result: ${result.toStringAsFixed(2)}"),
        Text(
          "Age: $age",
        )
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Accept',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
    ],
  );
}
