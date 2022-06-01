import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'alert.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late double result;

  bool isMale = false;
  double heightVal = 90;
  int weight = 22;
  int age = 33;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Body Mass Index'),
      ),
      body: SafeArea(
          child: Column(/*mainAxisAlignment: MainAxisAlignment.center*/
              children: [
        // const SizedBox(
        //   height: 5,
        // ),
        Expanded(
            // flex: 1 ~/ 2,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  children: [
                    m1Expanded(context, 'Male'),
                    const SizedBox(
                      width: 15,
                    ),
                    m1Expanded(context, 'Female')
                  ],
                ))),
        Expanded(
            flex: (1 ~/ 2),
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 34,
                        ),
                        Text(
                          'Height',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              heightVal.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Text(
                              'CM',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Slider(
                          value: heightVal,
                          onChanged: (newValue) {
                            setState(() {
                              heightVal = newValue;
                            });
                          },
                          max: 220,
                          min: 90,
                        )
                      ],
                    )))),
        Expanded(
          // flex: 1 ~/ 2,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 13, bottom: 15, left: 20, right: 20),
            child: Row(
              children: [
                m2Expanded(context, 'Weight'),
                const SizedBox(
                  width: 15,
                ),
                m2Expanded(context, 'Age')
              ],
            ),
          ),
        ),
        Expanded(
            flex: 1 ~/ 4,
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 12,
                color: Colors.teal,
                child: TextButton(
                  onPressed: () {
                    result = weight / pow(heightVal / 100, 2);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return buildAlertDialog(context, isMale, result, age);
                      },
                    );
                  },
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.button,
                  ),
                )))
      ])),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = type == 'Male' ? true : false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: (isMale && type == 'Male') ||
                          (!isMale && type == 'Female')
                      ? Colors.teal
                      : Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(type == 'Male' ? Icons.male : Icons.female,
                      color: Colors.white, size: 90),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    type == 'Male' ? 'Male' : 'Female',
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
            )));
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == 'Age' ? 'Age' : 'Weight',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            type == 'Age' ? '$age' : '$weight',
            style: Theme.of(context).textTheme.headline3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: type == 'Age' ? 'age++' : 'weight++',
                onPressed: () {
                  setState(() {
                    type == 'Age' ? age++ : weight++;
                  });
                },
                child: const Icon(
                  Icons.add,
                  size: 15,
                ),
                mini: true,
              ),
              const SizedBox(
                width: 8,
              ),
              FloatingActionButton(
                heroTag: type == 'Age' ? 'age--' : 'weight--',
                onPressed: () {
                  setState(() {
                    type == 'Age' ? age-- : weight--;
                  });
                },
                child: const Icon(Icons.remove, size: 15),
                mini: true,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
