import 'dart:developer' as dev;

import 'package:fdynamic_ui/components/default_components.dart';
import 'package:flutter/material.dart';

import '../logics/builder_components.dart';
import '../logics/parse_proprerties.dart';

Widget buildColumn(Iterator<String> iterator) {
  Map proprerties = extractProperties(iterator);
  var children = <Widget>[];

  int length = proprerties.containsKey('length') ? parseInt(proprerties['length']) : 1;

  int interactions = 0;
  while (true) {
    interactions++;

    children.add(buildComponent(iterator));
    dev.log('Column - Component addition $interactions', name: 'Flutter Dynamic UI');

    if (interactions == length) break;
  }

  return Column(children: children);
}
