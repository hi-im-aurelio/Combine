import 'package:flutter/material.dart';

import '../logics/builder_components.dart';

Widget buildSizedBox(Iterator<String> iterator) {
  // Map proprerties = extractProperties(properties);
  // print(proprerties);

  return SizedBox(
    child: buildComponent(iterator),
  );
}
