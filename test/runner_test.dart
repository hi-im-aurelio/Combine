// ignore_for_file: avoid_print, unused_local_variable

void main() {
  const String myString = """
    Container<root>
      color: red
      Center
        Text
  """;

  List<String> lines = myString.split('\n');

  var components = parser(lines);

  print("===============================================");
  print(components);
}

parser(List<String> lines) {
  Map<String, dynamic> components = {};

  String rootComponent = "";

  for (String l in lines) {
    String line = l.trim();
    if (line.isEmpty) return;

    if (line.endsWith("<root>")) {
      rootComponent = line.replaceFirst('<root>', '');

      components[rootComponent] = {};

      continue;
    }

    if (line[0] == line[0].toUpperCase()) {
    } else {
      components[rootComponent][0] = line;
    }
  }

  return components;
}
