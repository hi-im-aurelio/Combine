import 'package:flutter/material.dart';

import '../logics/builder_components.dart';
import '../logics/parse_proprerties.dart';
import 'default_components.dart';

Widget buildContainer(Iterator<String> iterator) {
  Map proprerties = extractProperties(iterator);

  return Container(
    color: proprerties.containsKey('color') ? parseColor(proprerties['color']) : null,
    height: proprerties.containsKey('height') ? parseDouble(proprerties['height']) : null,
    width: proprerties.containsKey('width') ? parseDouble(proprerties['width']) : null,
    alignment: proprerties.containsKey('alignment') ? parseAlignment(proprerties['alignment']) : null,
    child: buildComponent(iterator),
  );
}
