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
        // Adicionar diretamente as propriedades não aninhadas
        properties[key] = value;

        // Se a propriedade for 'style', também analisar as propriedades aninhadas
        if (key == 'style') {
          properties[key] = parseProperties(value);
        }
      }
    }
  }

  print(properties);
  return properties;
}
