import 'package:flutter/material.dart';

Widget builder(String coc) {
  List<String> lines = coc.split('\n');
  return buildWidget(lines.iterator);
}

Widget buildWidget(Iterator<String> iterator) {
  if (!iterator.moveNext()) return const SizedBox.shrink();

  var line = iterator.current.trim();
  var parts = line.split(' ');

  if (parts[0] == 'Container') {
    return buildContainer(iterator);
  } else if (parts[0] == 'Center') {
    return buildCenter(iterator);
  } else if (parts[0] == 'Text') {
    return buildText(iterator);
  }

  return const SizedBox.shrink();
}

Widget buildContainer(Iterator<String> iterator) {
  if (!iterator.moveNext()) return const SizedBox.shrink();

  var line = iterator.current.trim();
  var properties = parseProperties(line);

  // Verifique se há um filho (widget aninhado) e avance para ele
  var childWidget = buildWidget(iterator);

  return Container(
    color: Colors.red,
    // padding: properties['padding'] ?? EdgeInsets.zero,
    child: childWidget,
    // Outras propriedades...
  );
}

Widget buildCenter(Iterator<String> iterator) {
  // Verifique se há um filho (widget aninhado) e avance para ele
  var childWidget = buildWidget(iterator);

  return Center(child: childWidget);
}

Widget buildText(Iterator<String> iterator) {
  if (!iterator.moveNext()) return const SizedBox.shrink();

  var line = iterator.current.trim();
  var properties = parseProperties(line);

  print(properties["textAlign"]);

  return Text(
    properties['text'] ?? '',
    // textAlign: properties.containsKey('textAlign') ? parseTextAlign(properties['textAlign']) : null,
    // style: properties.containsKey('style') ? parseTextStyle(properties['style']) : null,
    // overflow: properties.containsKey('overflow') ? parseTextOverflow(properties['overflow']) : null,
    // maxLines: properties.containsKey('maxLines') ? parseInt(properties['maxLines']) : null,
  );
}

Color parseColor(String color) {
  try {
    return Color(int.parse(color, radix: 16) | 0xFF000000);
  } catch (e) {
    print('Erro ao converter cor: $e');
    return Colors.black87;
  }
}

double parseDouble(String value) {
  try {
    return double.parse(value);
  } catch (e) {
    print('Erro ao converter double: $e');
    return 14;
  }
}

int parseInt(String value) {
  try {
    return int.parse(value);
  } catch (e) {
    print('Erro ao converter inteiro: $e');
    return 1;
  }
}

TextOverflow parseTextOverflow(String overflow) {
  switch (overflow.toLowerCase()) {
    case 'clip':
      return TextOverflow.clip;
    case 'fade':
      return TextOverflow.fade;
    case 'ellipsis':
      return TextOverflow.ellipsis;
    default:
      return TextOverflow.clip;
  }
}

TextStyle parseTextStyle(Map<String, dynamic> properties) {
  return TextStyle(
    color: parseColor(properties['color']),
    fontSize: parseDouble(properties['fontSize']),
  );
}

TextAlign parseTextAlign(String textAlign) {
  switch (textAlign.toLowerCase()) {
    case 'left':
      return TextAlign.left;
    case 'right':
      return TextAlign.right;
    case 'center':
      return TextAlign.center;
    case 'justify':
      return TextAlign.justify;
    default:
      return TextAlign.center;
  }
}

Map<String, dynamic> parseProperties(String line) {
  var properties = <String, dynamic>{};

  var regex = RegExp(r'(\S+):([\s\S]+?(?=\S+:|$))', multiLine: true);
  var matches = regex.allMatches(line);

  for (var match in matches) {
    var key = match.group(1)?.trim();
    var value = match.group(2)?.trim();

    if (key != null && value != null) {
      // Verificar se a propriedade é aninhada
      if (key.contains('.')) {
        var keys = key.split('.');
        var nestedMap = properties;

        // Criar estrutura aninhada
        for (var i = 0; i < keys.length - 1; i++) {
          if (!nestedMap.containsKey(keys[i])) {
            nestedMap[keys[i]] = <String, dynamic>{};
          }
          nestedMap = nestedMap[keys[i]];
        }

        // Atribuir o valor à propriedade aninhada
        var lastKey = keys.last;
        if (!nestedMap.containsKey(lastKey)) {
          nestedMap[lastKey] = value;
        } else if (nestedMap[lastKey] is Map) {
          // Mesclar se já existir uma estrutura aninhada com a mesma chave
          var nestedValue = nestedMap[lastKey] as Map<String, dynamic>;
          var nestedProperties = parseProperties(value);
          nestedValue.addAll(nestedProperties);
        }
      } else {
        properties[key] = value;
      }
    }
  }

  print(properties);
  return properties;
}
