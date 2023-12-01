import 'package:flutter/material.dart';

import '../components/center_component.dart';
import '../components/container_component.dart';
import '../components/text_component.dart';

Widget buildComponent(Iterator<String> iterator) {
  if (!iterator.moveNext()) return const SizedBox.shrink();

  var line = iterator.current.trim();
  var parts = line.split(' ');

  if (parts[0] == 'Container') {
    return buildContainer(iterator);
  } else if (parts[0] == 'Center') {
    return buildCenter(iterator);
  } else if (parts[0] == 'Text') {
    return buildText(iterator);
  }

  return const SizedBox.shrink();
}
