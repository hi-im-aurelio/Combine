# Attention. This is not an official package yet. Still in the development and testing phase.
# Floating dynamic UI

**Flutter Dynamic UI** aims to make it easier to update the user interface in Flutter applications in a simple and efficient way, inspired by the concept of "code push".

The project allows the definition of the user interface through a formatted string called “coc string”, providing flexibility and ease in maintaining and updating the UI.

## Language structure

The language uses an approach based on formatted strings, called "coc strings", to represent the hierarchy of components and their properties. Each component is defined with its properties in a readable format, followed by the “break” keyword to indicate the end of that specific block.

Example of "string coc":

```dart
String application = """
       Center
         break
         Container
           color: deepPurpleAccent
           height: 100
           width: 100
           break
           Text
             text: Lorem ipsum dolor sit amet consectetur adipisicing elit and definition.
             textAlign: center
             break
""";
```

## Parser and Builder

The project includes a set of parsing functions and a constructor that interprets the "coc string" to create the corresponding widget hierarchy. Analysis is performed through a set of logic that recognizes components and properties, while the builder translates this information into Flutter widgets.

## Supported Components

Currently, the project supports the following components:

- `MaterialApp`
- `Scaffolding`
- `AppBar`
- `Column`
- `Container`
- `SizedBox`
- `Center`
- `Text`

Each component has a set of specific properties that can be configured in the "coc string".

## Example of use

You can integrate **Flutter Dynamic UI** into your project as follows:

1. Add the `string coc` to a file, for example `app.flutter`:

```dart
MaterialApp
  debugShowCheckedModeBanner: false
  useMaterial3: false
  break
  Scaffold
    enableAppBar: true
    title: AppDemo
    centerTitle: false
    break
    Column
      length: 2
      break
      Text
        text: First text
        textAlign: center
        break
      Text
        text: Second text
        textAlign: center
        break
```

2. Import the "coc string" into `main.dart` and use the constructor to create the interface:

```dart
void main() => runApp(builder(string));
```

This approach allows for a clear separation between interface definition and Dart logic, providing flexibility for remote updates.

## Contribution

Contributions are welcome! Feel free to open issues and submit pull requests to make **Flutter Dynamic UI** even more robust and versatile.