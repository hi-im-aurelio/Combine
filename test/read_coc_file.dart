import 'package:flutter/services.dart';

Future<String> readCocFile(String filePath) async {
  try {
    return await rootBundle.loadString(filePath);
  } catch (e) {
    throw ("Erro ao ler o arquivo .coc: $e");
  }
}
