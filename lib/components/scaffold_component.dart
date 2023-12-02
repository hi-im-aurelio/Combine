import 'package:fdynamic_ui/logics/builder_components.dart';
import 'package:flutter/material.dart';

import '../logics/parse_proprerties.dart';
import 'default_components.dart';

Scaffold buildScaffold(Iterator<String> iterator) {
  Map properties = extractProperties(iterator);

  var title = properties.containsKey('title') ? properties['title'] : 'Flutter Demo';
  var enableTheme = properties.containsKey('enableTheme') ? parseBool(properties['enableTheme']) : false;
  var color = properties.containsKey('color') ? parseColor(properties['color']) : null;
  var useMaterial3 = properties.containsKey('useMaterial3') ? parseBool(properties['useMaterial3']) : true;

  return Scaffold(
    //     Key? key,
    //     PreferredSizeWidget? appBar,
    body: buildComponent(iterator),
    //     Widget? floatingActionButton,
    //     FloatingActionButtonLocation? floatingActionButtonLocation,
    //     FloatingActionButtonAnimator? floatingActionButtonAnimator,
    //     List<Widget>? persistentFooterButtons,
    //     AlignmentDirectional persistentFooterAlignment = AlignmentDirectional.centerEnd,
    //     Widget? drawer,
    //     void Function(bool)? onDrawerChanged,
    //     Widget? endDrawer,
    //     void Function(bool)? onEndDrawerChanged,
    //     Widget? bottomNavigationBar,
    //     Widget? bottomSheet,
    // Color? backgroundColor,
    // bool? resizeToAvoidBottomInset,
    // bool primary = true,
    // DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start,
    // bool extendBody = false,
    // bool extendBodyBehindAppBar = false,
    // Color? drawerScrimColor,
    // double? drawerEdgeDragWidth,
    // bool drawerEnableOpenDragGesture = true,
    // bool endDrawerEnableOpenDragGesture = true,
    // String? restorationId,
  );
}
