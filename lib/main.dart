import 'package:flutter/material.dart';

import 'builder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String fDynamicUI = """
    Container 
      padding: EdgeInsets.all(16)
      color: #FF0000
      break
      Center
        break
        Text
          text: Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem, nostrum. Provident voluptatem rem magni impedit dicta ex, obcaecati placeat fugiat quas doloribus et deleniti cumque soluta, totam molestias! Iure, totam?
          textAlign: center
          fontSize: 24
          inherit: true
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
}
