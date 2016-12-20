# Getting Started

```
brew install bazel
bazel test //src/test:unit
```

In IntelliJ, you can install the [Intellij with Bazel](https://ij.bazel.io)
plugin and "Import from workspace" the `src/perquackey.bazelproject` file.

## Adding dependencies

```
./tools/third_party com.google.guava:guava:20.0
```
