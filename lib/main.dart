import 'package:flutter/material.dart';

import 'builder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String fDynamicUI = """
    Center
      break
      Container
        color: deepPurpleAccent
        height: 100
        width: 100
        break
        Text
          text: Lorem ipsum dolor sit amet consectetur adipisicing elit, and definition.
          textAlign: center
          break
""";

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: MyDynamicUIApp(fDynamicUI),
    );
  }
}

class MyDynamicUIApp extends StatelessWidget {
  final String string;
  const MyDynamicUIApp(this.string, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(body: builder(string));
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //   );
  // }
}
