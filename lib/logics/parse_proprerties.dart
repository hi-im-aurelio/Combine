Map<String, dynamic> extractProperties(Iterator<String> iterator) {
  if (!iterator.moveNext()) return {};

  Map<String, dynamic> properties = {};
  var line = iterator.current.trim();

  // Identifica linhas comentadas ou, vazias.
  while (line.isEmpty || line.startsWith('//')) {
    iterator.moveNext();
    break;
  }

  while (line[0] == line[0].toLowerCase()) {
    properties.addAll(parseProperties(line));

    if (line == 'break') {
      break;
    } else {
      iterator.moveNext();
    }

    line = iterator.current.trim();
  }

  return properties;
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
