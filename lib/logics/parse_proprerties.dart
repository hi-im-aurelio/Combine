Map<String, dynamic> extractProperties(Iterator<String> iterator) {
  if (!iterator.moveNext()) return {};

  Map<String, dynamic> properties = {};
  var line = iterator.current.trim();

  while (line.isEmpty || line.startsWith('//')) {
    line = iterator.current.trim();
  }

  while (line[0] == line[0].toLowerCase()) {
    properties.addAll(parseProperties(line));

    if (line == 'break') break;
    if (!iterator.moveNext()) {
      break;
    }
    line = iterator.current.trim();
    // break;
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
