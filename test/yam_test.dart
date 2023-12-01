void main() {
  var widgetString = """
Container(
  color: Colors.red,
  padding: EdgeInsets.all(16),
  child: Text(
    "Flutter",
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      color: Colors.red,
      fontSize: 18.0,
    ),
  ),
)
""";

  var widgetMap = convertStringToMap(widgetString);
  print(widgetMap);
}

Map<String, dynamic> convertStringToMap(String input) {
  var cleanedInput = input.replaceAll(RegExp(r'\s+'), ''); // Remove espaços em branco e quebras de linha

  var pattern = RegExp(r'(\w+)\(([^)]*)\)');
  var matches = pattern.allMatches(cleanedInput);

  return _convertMatchesToMap(matches);
}

Map<String, dynamic> _convertMatchesToMap(Iterable<RegExpMatch> matches) {
  var result = <String, dynamic>{};

  for (var match in matches) {
    var widgetName = match.group(1);
    var widgetParams = match.group(2);

    var paramsMap = _convertParamsToMap(widgetParams!);

    result[widgetName!] = paramsMap;
  }

  return result;
}

Map<String, dynamic> _convertParamsToMap(String params) {
  var result = <String, dynamic>{};

  var keyValuePairs = params.split(',');

  for (var pair in keyValuePairs) {
    var parts = pair.split(':');
    if (parts.length == 2) {
      var key = parts[0].trim();
      var value = parts[1].trim();

      // Convert string values to their Dart equivalents
      if (value.startsWith('EdgeInsets')) {
        // Handle EdgeInsets
        result[key] = value;
      } else if (value.startsWith('Text(')) {
        // Handle nested Text widget
        var textMap = convertStringToMap(value);
        result[key] = textMap;
      } else {
        // Assume other values are strings
        result[key] = value;
      }
    }
  }

  return result;
}
