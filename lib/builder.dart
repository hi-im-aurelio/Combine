import 'package:flutter/material.dart';

import 'logics/builder_components.dart';

Widget builder(String coc) {
  List<String> lines = coc.split('\n');
  return buildComponent(lines.iterator);
}
