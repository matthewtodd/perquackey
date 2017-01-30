# Getting Started

1. `brew install bazel`

## Common

### Command Line

1. `bazel build //src:common`

### IntelliJ

1. Install [IntelliJ](https://www.jetbrains.com/idea).
1. Install the [Intellij with Bazel](https://ij.bazel.build) plugin.
1. "Import from workspace" the `src/common.bazelproject` file.

## Android

### Command Line

Using Android Studio to get the Android SDK here...

1. Install [Android Studio](https://developer.android.com/studio/index.html).
1. `ln -s ~/Library/Android third_party/android`
1. `./tools/android`
  * Tools
    * Android SDK Build-tools 22.0.1
  * Android 5.1.1 (API 22)
    * SDK Platform
    * Intel x86 Atom 64 System Image
    * Sources for Android SDK
  * Extras
    * Android Support Repository
1. `bazel build //src:android`

#### [Virtual Device](https://developer.android.com/studio/run/emulator.html)

1. `./tools/android create avd -t android-22 -device "Nexus 4" -n matthewtodd`
1. In Android Studio -> Tools -> Android -> AVD Manager, check Enable Device Frame.
1. `./tools/emulator -avd matthewtodd &`
1. `bazel mobile-install //src:android`

#### [Physical Device](https://developer.android.com/studio/run/device.html)

1. Turn on Settings -> Developer options -> USB Debugging.
1. `bazel mobile-install //src:android`

### Android Studio

1. Install the [Android Studio with Bazel](https://ij.bazel.build) plugin.
1. "Import from workspace" the `src/android.bazelproject` file.

## Adding dependencies

```
./tools/third_party com.google.guava:guava:20.0
```

# Roadmap

1. Common

1. Android

1. Web
  1. Spike on GWT transpiling.
    * Use [rules_gwt](https://github.com/bazelbuild/rules_gwt)?
    * How about [rules_closure](https://github.com/bazelbuild/rules_closure)?

1. iOS
  1. Could work around it, but waiting for [j2objc_library to work](https://github.com/bazelbuild/bazel/issues/2368).
  1. macOS!
    1. Waiting for [crosstool support in ObjC rules](https://github.com/bazelbuild/bazel/issues/125).
