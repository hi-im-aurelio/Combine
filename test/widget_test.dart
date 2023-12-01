void main() {
  const String cocString = """
    Container
      padding: EdgeInsets.all(16)
      Center
        child: Text
          text: "Hello, Flutter"
          style
            color: #FF0000
            fontSize: 18.0
          overflow: ellipsis
          maxLines: 1
  """;

  Map<String, dynamic> result = parseCocString(cocString);
  print(result);
}

Map<String, dynamic> parseCocString(String cocString) {
  List<String> lines = cocString.split('\n');
  List<Map<String, dynamic>> stack = [{}];

  for (String line in lines) {
    line = line.trim();
    if (line.isNotEmpty) {
      List<String> parts = line.split(' ');
      String widgetName = parts[0];

      Map<String, dynamic> widgetProperties = {};
      Map<String, dynamic> currentWidget = {widgetName: widgetProperties};
      stack.last[widgetName] = currentWidget;

      stack.add(widgetProperties);

      for (int i = 1; i < parts.length; i++) {
        List<String> prop = parts[i].split(':');
        String propName = prop[0].trim();
        String propValue = prop.sublist(1).join(':').trim();

        if (propName[0].toUpperCase() == propName[0]) {
          // Widget
          Map<String, dynamic> nestedWidget = {propName: {}};
          widgetProperties['child'] = nestedWidget;
          currentWidget = nestedWidget;
          stack.add(nestedWidget);
        } else {
          // Propriedade
          widgetProperties[propName] = propValue;
        }
      }
    }
  }

  return stack[0];
}
