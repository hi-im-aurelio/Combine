import 'package:fdynamic_ui/logics/builder_components.dart';
import 'package:flutter/material.dart';

Widget buildCenter(Iterator<String> iterator) {
  // Verifique se há um filho (widget aninhado) e avance para ele
  var childWidget = buildComponent(iterator);

  return Center(child: childWidget);
}
