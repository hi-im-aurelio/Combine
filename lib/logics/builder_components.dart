import 'package:flutter/material.dart';

import '../components/center_component.dart';
import '../components/container_component.dart';
import '../components/material_app_component.dart';
import '../components/scaffold_component.dart';
import '../components/sizedbox_component.dart';
import '../components/text_component.dart';

String extractComponent(Iterator<String> iterator) {
  var line = iterator.current.trim();
  var parts = line.split(' ');
  return parts[0];
}

Widget buildComponent(Iterator<String> iterator) {
  while (iterator.moveNext()) {
    switch (extractComponent(iterator)) {
      case 'MaterialApp':
        return buildMaterialApp(iterator);
      case 'Scaffold':
        return buildScaffold(iterator);
      case 'Container':
        return buildContainer(iterator);
      case 'SizedBox':
        return buildSizedBox(iterator);
      case 'Center':
        return buildCenter(iterator);
      case 'Text':
        return buildText(iterator);
    }
  }

  return const SizedBox.shrink();
}
