<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# dual_scroll

DualScroll is a Flutter widget package that enables easy implementation of two-dimensional scrollable grids. It allows you to create content that can be scrolled both vertically and horizontally.

## Features

- Two-dimensional (vertical and horizontal) scrollable grid layout
- Customizable vertical spacing between items
- Custom ScrollPhysics for both vertical and horizontal scrolling
- Customizable padding support

## Getting Started

1. Add dependency to pubspec.yaml:

```yaml
dependencies:
  dual_scroll: ^1.0.0
```

2. Install the package:

```bash
flutter pub get
```

3. Import the package:

```dart
import 'package:dual_scroll/dual_scroll.dart';
```

## Usage

Basic example:

```dart
DualScroll(
  items: [
    [
      Container(width: 100, height: 100, color: Colors.red),
      Container(width: 100, height: 100, color: Colors.blue),
      Container(width: 100, height: 100, color: Colors.green),
    ],
    [
      Container(width: 100, height: 100, color: Colors.yellow),
      Container(width: 100, height: 100, color: Colors.purple),
      Container(width: 100, height: 100, color: Colors.orange),
    ],
  ],
  verticalSpacing: 16.0,
  padding: EdgeInsets.all(16.0),
)
```

Applying custom scroll physics:

```dart
DualScroll(
  items: itemsList,
  verticalPhysics: BouncingScrollPhysics(),
  horizontalPhysics: ClampingScrollPhysics(),
)
```

## Parameters

| Parameter | Type | Description |
|------------|-------|-------------|
| items | List<List<Widget>> | 2D list of widgets to display |
| verticalSpacing | double | Spacing between vertical items (default: 20.0) |
| verticalPhysics | ScrollPhysics? | Physics for vertical scrolling |
| horizontalPhysics | ScrollPhysics? | Physics for horizontal scrolling |
| padding | EdgeInsetsGeometry? | Padding around the entire scroll view |

## Additional Information

- Please report bugs and feature requests on the [Issues page]
- Pull requests are welcome

## License

This project is released under the MIT License.
