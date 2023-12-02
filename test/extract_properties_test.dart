import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Extrair propriedades', () {
    const text = """
  text: Hello 
  size_y: 50
  size_x: 50 
  color: red
  fontSize: 18
  """;

    final properties = parseProperties(text);

    expect(properties, {'text': 'Hello', 'size_y': '50', 'size_x': '50', 'color': 'red', 'fontSize': '18'});
  });
}

Map<String, dynamic> parseProperties(String line) {
  var properties = <String, dynamic>{};

  var regex = RegExp(r'(\S+):([\s\S]+?(?=\S+:|$))', multiLine: true);
  var matches = regex.allMatches(line);

  for (var match in matches) {
    var key = match.group(1)?.trim();
    var value = match.group(2)?.trim();

    if (key != null && value != null) {
      properties[key] = value;
    }
  }
  return properties;
}
