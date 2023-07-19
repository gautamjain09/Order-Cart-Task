import 'package:flutter/material.dart';

const primaryColor = Colors.blue;
const whiteColor = Colors.white;
const blackColor = Colors.black;

List<int> itemsCount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
List<String> itemsName = [
  "First",
  "Second",
  "Third",
  "Fourth",
  "Fifth",
  "Sixth",
  "Seventh",
  "Eigth",
  "Ninth",
  "Tenth"
];

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}
