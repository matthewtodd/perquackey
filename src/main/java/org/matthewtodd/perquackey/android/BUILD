android_binary(
    name = "android",
    srcs = glob(["*.java"]),
    manifest = "AndroidManifest.xml",
    resource_files = glob(["res/**"]),
    deps = [
        "//src/main/java/org/matthewtodd/perquackey/common:common",
        "//third_party/com_android_support_appcompat_v7:appcompat-v7",
    ],
    visibility = ["//visibility:public"],
)
