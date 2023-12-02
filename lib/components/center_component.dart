import 'package:fdynamic_ui/logics/builder_components.dart';
import 'package:flutter/material.dart';

Widget buildCenter(Iterator<String> iterator) {
  return Center(child: buildComponent(iterator));
}
