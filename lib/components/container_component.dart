import 'package:flutter/material.dart';

import '../logics/builder_components.dart';
import '../logics/parse_proprerties.dart';

Widget buildContainer(Iterator<String> iterator) {
  Map proprerties = extractProperties(iterator);
  print("Propriedades do Container: " + proprerties.toString());
  return Container(
    color: Colors.blue,
    child: buildComponent(iterator),
  );
}
