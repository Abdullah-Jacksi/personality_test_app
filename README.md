# Mobile Code Challenge Flutter Solution

<img src="https://img.shields.io/badge/made%20with-dart-blue.svg" alt="made with dart">

The task is to implement a personality test app to let the user find out what personality type he is if he is an introvert or an extrovert

## Screenshot
<img src="https://github.com/Abdullah-Jacksi/personality_test_app/blob/master/assets/screenshot.png" width="300" />

## What has been implemented
The basic features that are fulfilled include:

- [x] As a User I should be able to select an answer and answer the questions of the personality test.
- [x] As a User I should be able to go back and change my answers as long as I don't click on the Finish text button.
- [x] As a User I should be able to get the results of the personality test.

## Folder Structure
```bash
.
├── core
│   ├── constants
│   ├── models
│   ├── data
│   ├── domain
│   └── view_models
├── ui
│   ├── utils
│   ├── views
│   └── widgets
└── config

```

## Folder Structure explanation
The lib folder is divided into three folders; core, ui, and config. Core contains all the files associated with the logic. Ui contains all the files associated with the ui. Config is for configurations.

* core
    * constants
        * Holds app constants and enums.
    * models
        * Contains all the plain data models.
    * data
        * This layer interacts directly with an API (REST API or a device API).
    * domain
        * This layer transforms or manipulates the data that the API provides.
    * view_models
        * This layer manages the state (Business logic layer). contains a view model for each view which will act as an interface between a view and domains.

* ui
    * utils
        * Contains functions or constants that are used in multiple other UI files.
    * views
        * Contains the main app screens.
    * widgets
        * Contains widget files that are too big to keep in the view files.
        * Usually contains shared widgets that are classes extending stateless widgets.

* config
    * configuration files for routing, providers, and locators


## Plugins used ##
- provider: ^6.0.2

## How to run ##
- Run `flutter packages get` to download pubspec dependencies.
- Run `flutter clean` for most of the first-run errors you may face.
- Run `flutter test` to execute tests.
- Run `flutter run` to try it live on a running emulator or USB connected device.
- You can target a specific device to run by running `flutter devices` and getting the id and running `flutter run -d <device_id>`.
- Run `flutter build apk` to generate the APK file.
- Run `flutter build ios` to package the iOS app.