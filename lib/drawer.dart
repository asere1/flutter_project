import 'package:flutter/material.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: Colors.teal,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(
                    'images/OIP.jfif',
                  ),
                  fit: BoxFit.contain),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: null,
          ),
          const Divider(
            thickness: 1,
            height: 20,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 3),
            child: Text(
              'Thin: BMI < 18.5',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 140,
            height: 20,
            color: Colors.black,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 3),
            child: Text('Normal: BMI <= 24.9',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center),
          ),
          const Divider(
            thickness: 1,
            endIndent: 140,
            height: 20,
            color: Colors.black,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 3),
            child: Text('Over Weight: BMI > 25',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center),
          ),
          const Divider(
            thickness: 1,
            indent: 140,
            height: 20,
            color: Colors.black,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 3),
            child: Text('Obese: BMI >= 30',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center),
          ),
          const Divider(
            thickness: 1,
            height: 20,
            color: Colors.black,
          ),
        ],
      ),
    ),
  );
}
