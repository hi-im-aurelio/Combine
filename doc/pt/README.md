## Parser e Builder

O projeto inclui um conjunto de funções de parse e um builder que interpreta a "coc string" para criar a hierarquia de widgets correspondente. O parse é realizado por meio de um conjunto de lógicas que reconhecem componentes e propriedades, enquanto o builder traduz essas informações em widgets Flutter.

## Componentes Suportados

Atualmente, o projeto suporta os seguintes componentes:

- `Container`
- `SizedBox`
- `Center`
- `Text`

Cada componente possui um conjunto de propriedades específicas que podem ser configuradas na "coc string".

## Exemplo de Uso

Você pode integrar o **Flutter Dynamic UI** em seu projeto da seguinte maneira:

1. Adicione a `coc string` em um arquivo, por exemplo, `app.flutter`:

```
MaterialApp
    break
    Scaffold
          title: App Demo
          break
          Center
               break
                Text
                     break
                      text: I, Flutter
                      break
```

2. Importe a "coc string" no `main.dart` e utilize o builder para criar a interface:

```dart
void main() => runApp(builder(string));
```

Essa abordagem permite uma clara separação entre a definição da interface e a lógica Dart, proporcionando flexibilidade para atualizações remotas.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir problemas (issues) e enviar pull requests para tornar o **Flutter Dynamic UI** ainda mais robusto e versátil.