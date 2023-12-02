import 'package:flutter/material.dart';

Color? parseColor(String colorName) {
  switch (colorName) {
    case 'transparent':
      return Colors.transparent;
    case 'black':
      return Colors.black;
    case 'black87':
      return Colors.black87;
    case 'black54':
      return Colors.black54;
    case 'black45':
      return Colors.black45;
    case 'black38':
      return Colors.black38;
    case 'black26':
      return Colors.black26;
    case 'black12':
      return Colors.black12;
    case 'white':
      return Colors.white;
    case 'white70':
      return Colors.white70;
    case 'white60':
      return Colors.white60;
    case 'white54':
      return Colors.white54;
    case 'white38':
      return Colors.white38;
    case 'white30':
      return Colors.white30;
    case 'white24':
      return Colors.white24;
    case 'white12':
      return Colors.white12;
    case 'white10':
      return Colors.white10;

    // Primary Colors
    case 'red':
      return Colors.red;
    case 'pink':
      return Colors.pink;
    case 'purple':
      return Colors.purple;
    case 'deepPurple':
      return Colors.deepPurple;
    case 'indigo':
      return Colors.indigo;
    case 'blue':
      return Colors.blue;
    case 'lightBlue':
      return Colors.lightBlue;
    case 'cyan':
      return Colors.cyan;
    case 'teal':
      return Colors.teal;
    case 'green':
      return Colors.green;
    case 'lightGreen':
      return Colors.lightGreen;
    case 'lime':
      return Colors.lime;
    case 'yellow':
      return Colors.yellow;
    case 'amber':
      return Colors.amber;
    case 'orange':
      return Colors.orange;
    case 'deepOrange':
      return Colors.deepOrange;
    case 'brown':
      return Colors.brown;
    case 'blueGrey':
      return Colors.blueGrey;

    // Accent Colors
    case 'redAccent':
      return Colors.redAccent;
    case 'pinkAccent':
      return Colors.pinkAccent;
    case 'purpleAccent':
      return Colors.purpleAccent;
    case 'deepPurpleAccent':
      return Colors.deepPurpleAccent;
    case 'indigoAccent':
      return Colors.indigoAccent;
    case 'blueAccent':
      return Colors.blueAccent;
    case 'lightBlueAccent':
      return Colors.lightBlueAccent;
    case 'cyanAccent':
      return Colors.cyanAccent;
    case 'tealAccent':
      return Colors.tealAccent;
    case 'greenAccent':
      return Colors.greenAccent;
    case 'lightGreenAccent':
      return Colors.lightGreenAccent;
    case 'limeAccent':
      return Colors.limeAccent;
    case 'yellowAccent':
      return Colors.yellowAccent;
    case 'amberAccent':
      return Colors.amberAccent;
    case 'orangeAccent':
      return Colors.orangeAccent;
    case 'deepOrangeAccent':
      return Colors.deepOrangeAccent;

    default:
      return null;
  }
}

AlignmentGeometry? parseAlignment(String alignment) {
  switch (alignment.toLowerCase()) {
    case 'topLeft':
      return Alignment.topLeft;
    case 'topCenter':
      return Alignment.topCenter;
    case 'topRight':
      return Alignment.topRight;
    case 'centerLeft':
      return Alignment.centerLeft;
    case 'center':
      return Alignment.center;
    case 'centerRight':
      return Alignment.centerRight;
    case 'bottomLeft':
      return Alignment.bottomLeft;
    case 'bottomCenter':
      return Alignment.bottomCenter;
    case 'bottomRight':
      return Alignment.bottomRight;
  }

  return null;
}

bool parseBool(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
  }

  return false;
}

double parseDouble(String value) {
  try {
    return double.parse(value);
  } catch (e) {
    return 14;
  }
}

int parseInt(String value) {
  try {
    return int.parse(value);
  } catch (e) {
    return 1;
  }
}
