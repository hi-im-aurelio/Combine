import 'package:fdynamic_ui/app.dart';
import 'package:flutter/material.dart';

import 'builder.dart';

void main() {
  runApp(builder(app));
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: MyDynamicUIApp(app),
//     );
//   }
// }
//
// class MyDynamicUIApp extends StatelessWidget {
//   final String string;
//   const MyDynamicUIApp(this.string, {super.key});
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Center(
//           child: Text("I Flutter"),
//         ),
//         appBar: AppBar(
//           title: Text("AppDemo"),
//         ),
//       );
//   // @override
//   // Widget build(BuildContext context) => Scaffold(body: builder(string));
// }
