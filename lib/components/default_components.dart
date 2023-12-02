import 'package:flutter/material.dart';

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

Color parseColor(String color) {
  try {
    return Color(int.parse(color, radix: 16) | 0xFF000000);
  } catch (e) {
    return Colors.black87;
  }
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
