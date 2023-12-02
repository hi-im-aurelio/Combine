import 'package:flutter/material.dart';

import '../logics/parse_proprerties.dart';

Widget buildText(Iterator<String> iterator) {
  // print(iterator.current.trim());
  Map proprerties = extractProperties(iterator);
  print("Propriedades do Text: " + proprerties.toString());

  return Text(
    'Static Text',
    // textAlign: properties.containsKey('textAlign') ? parseTextAlign(properties['textAlign']) : null,
    // style: properties.containsKey('style') ? parseTextStyle(properties['style']) : null,
    // overflow: properties.containsKey('overflow') ? parseTextOverflow(properties['overflow']) : null,
    // maxLines: properties.containsKey('maxLines') ? parseInt(properties['maxLines']) : null,
  );
}

Color parseColor(String color) {
  try {
    return Color(int.parse(color, radix: 16) | 0xFF000000);
  } catch (e) {
    print('Erro ao converter cor: $e');
    return Colors.black87;
  }
}

double parseDouble(String value) {
  try {
    return double.parse(value);
  } catch (e) {
    print('Erro ao converter double: $e');
    return 14;
  }
}

int parseInt(String value) {
  try {
    return int.parse(value);
  } catch (e) {
    print('Erro ao converter inteiro: $e');
    return 1;
  }
}

TextOverflow parseTextOverflow(String overflow) {
  switch (overflow.toLowerCase()) {
    case 'clip':
      return TextOverflow.clip;
    case 'fade':
      return TextOverflow.fade;
    case 'ellipsis':
      return TextOverflow.ellipsis;
    default:
      return TextOverflow.clip;
  }
}

TextStyle parseTextStyle(Map<String, dynamic> properties) {
  return TextStyle(
    color: parseColor(properties['color']),
    fontSize: parseDouble(properties['fontSize']),
  );
}

TextAlign parseTextAlign(String textAlign) {
  switch (textAlign.toLowerCase()) {
    case 'left':
      return TextAlign.left;
    case 'right':
      return TextAlign.right;
    case 'center':
      return TextAlign.center;
    case 'justify':
      return TextAlign.justify;
    default:
      return TextAlign.center;
  }
}
