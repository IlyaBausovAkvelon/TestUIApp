# TestUIApp

Simple UI app for UI testing.

## Description

This app is just the UI for getting information about Vegetables.
Vegetables data is stored in Vegetables.json
There are four main views in the app:

* Main list view (First tab of the tab view).
* View with button about vegetable of the day (Second tab of the tab view).
* Tab View itself.
* Details view about choosen vegetable.

## UI tests

App is covered by 7 UI tests now.
These tests covers the List View, Details View, Tab View and transitions between them.

## AppCenter CI

These repository has AppCenter builds and test runs.

Here the link to the one of the builds:
https://appcenter.ms/users/ilya.bausov/apps/TestUIApp/build/branches/master/builds/3

Here the link to the one of the test runs:
https://appcenter.ms/users/ilya.bausov/apps/TestUIApp/test/runs/222a3ba1-8f8d-4d97-b1b4-08f9160041a5

## How do I run tests on the AppCenter:

First we need to build bundle for tests by using xcodebuild:

```bash
$ xcrun xcodebuild build-for-testing -configuration Debug -workspace TestUIApp.xcworkspace -sdk iphoneos -scheme TestUIApp -derivedDataPath ~/Library/Developer/Xcode/DerivedData/ -allowProvisioningUpdates
```
Flag -allowProvisioningUpdates is needed here to automatically sign the build.

After build will be completed we need to send build to AppCenter cloud by command of AppCenter-CLI:
```bash
$ appcenter test run xcuitest --app ilya.bausov/TestUIApp --devices c8ad8d27 --test-series "master" --locale "en_US" --build-dir ~/Library/Developer/Xcode/DerivedData/Build/Products/Debug-iphoneos/
```
