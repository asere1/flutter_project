import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({required this.result, required this.isMale, required this.age});

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText = '';
    if (result >= 30) {
      resultText = 'Obese';
    } else if (result > 25 && result < 30) {
      resultText = 'Over Weight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }

    return resultText.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Result'),
      ),
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: AlertDialog(
              title: const Center(child: Text('Result')),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Gender: ${isMale ? 'Male' : 'Female'}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text("Result: ${result.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.headline1),
                  Text(
                    "Healthiness:  $resultPhrase",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  Text("Age: $age",
                      style: Theme.of(context).textTheme.headline1)
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'ACCEPT',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
