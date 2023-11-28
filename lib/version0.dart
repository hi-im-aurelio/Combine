import 'package:flutter/material.dart';

Widget builder(String coc) {
  List<String> lines = coc.split('\n');
  return buildWidget(lines.iterator);
}

Widget buildWidget(Iterator<String> iterator) {
  if (!iterator.moveNext()) return const SizedBox.shrink();

  var line = iterator.current.trim();
  var parts = line.split(' ');

  if (parts[0] == 'Container') {
    return Container(child: buildWidget(iterator));
  } else if (parts[0] == 'Center') {
    return Center(child: buildWidget(iterator));
  } else if (parts[0] == 'Text') {
    iterator.moveNext();
    return Text(iterator.current.trim());
  }

  return const SizedBox.shrink();
}
