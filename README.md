# Work Sample for Mobile Developer

This is my implementation for the work sample as stated [here](https://eqproduct.notion.site/Mobile-Developer-4ef5fe5531fe49cea83874c321cce509)

I've chosen Flutter Framework, It's open-source cross-platform app development framework that supports Android, IOS, Windows, Mac, Linux and Web

## The Code

There are two projects in the repo, `lib project` is the library projects, The Library class exists in the file `lib/eq_works_task.dart` and tests in `test/eq_works_task_test.dart`

The other project `work_sample_ui` is an app that references the library and uses it, the integration tests exist in `integration_test` folder

The App is tested on Android and IOS emulators, it's supposed to support Windows, Mac and Web, as all of them are supported by Geolocation plugin which is the only need for native functionality

## How to run tests

First you will have to install Flutter SDK, as stated [Here](https://docs.flutter.dev/get-started/install)

### Unit Test

at folder `/lib project`, run `flutter test`

### End-to-end Test

at folder `/work_sample_ui`, run `flutter test integration_test`

Note: for the end-to-end test to work, there must be a connected device already running

