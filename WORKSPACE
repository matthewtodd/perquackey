workspace(name = "perquackey")

# For now, you'll need to
# ln -s $ANDROID_HOME third_party/android

# On MacOS, this is probably
# ln -s ~/Library/Android third_party/android
#
# We may switch to using $ANDROID_HOME here once
# https://github.com/bazelbuild/bazel/issues/1390
# is resolved.
#
# See also
# https://github.com/bazelbuild/bazel/issues/746
# https://github.com/bazelbuild/bazel/issues/326
android_sdk_repository(
  name = "android_sdk",
  path = __workspace_dir__ + "/third_party/android/sdk",
  api_level = 22,
  build_tools_version = "22.0.1",
)
