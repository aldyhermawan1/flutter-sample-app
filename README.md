# Flutter Sample App

Sample App for Flutter

## Getting Started

To run the project, you need to specify the flavor and also set the build types of the app. For example if you want to run the app in **Dev flavor** and in **debug** types, you need to run the command:

```
flutter run --flavor Dev --debug -t /lib/main_dev.dart
```

## Flavor and Build Types

| Flavor | Description |
|-|-|
| Dev | The development type of the app |
|Production | The production type of the app |

| Build Types | Description |
|-|-|
|debug|Build types that still attach the debugger and didn't minify the code|
|profile|Build types that remove the debugger and minify the code, but still attach the API Inspector to profile the API log|
|release|Build types that remove all the debugger and minify the code|
