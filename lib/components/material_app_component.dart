import 'package:flutter/material.dart';

import '../logics/builder_components.dart';
import '../logics/parse_proprerties.dart';
import 'default_components.dart';

MaterialApp buildMaterialApp(Iterator<String> iterator) {
  Map properties = extractProperties(iterator);

  var title = properties.containsKey('title') ? properties['title'] : 'Flutter Demo';
  var enableTheme = properties.containsKey('enableTheme') ? parseBool(properties['enableTheme']) : false;
  var color = properties.containsKey('color') ? parseColor(properties['color']) : null;
  var useMaterial3 = properties.containsKey('useMaterial3') ? parseBool(properties['useMaterial3']) : true;

  var debugShowCheckedModeBanner = properties.containsKey('debugShowCheckedModeBanner') ? parseBool(properties['debugShowCheckedModeBanner']) : true;

  return MaterialApp(
    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    title: title,
    theme: !enableTheme
        ? null
        : ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: color!),
            useMaterial3: useMaterial3,
          ),
    home: buildComponent(iterator),
  );
}
