import 'package:fdynamic_ui/logics/builder_components.dart';
import 'package:flutter/material.dart';

import '../logics/parse_proprerties.dart';

Widget buildContainer(Iterator<String> iterator) {
  if (!iterator.moveNext()) return const SizedBox.shrink();

  var line = iterator.current.trim();
  var properties = parseProperties(line);

  // Verifique se há um filho (widget aninhado) e avance para ele
  var childWidget = buildComponent(iterator);

  return Container(
    color: Colors.red,
    // padding: properties['padding'] ?? EdgeInsets.zero,
    child: childWidget,
    // Outras propriedades...
  );
}
