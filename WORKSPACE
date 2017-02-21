workspace(name = "perquackey")

# I'd like to continue relying on ANDROID_HOME, but it looks like the best way
# to set that for IntelliJ / AndroidStudio to notice is using a LaunchAgent(!).
# Consider writing one in my dotfiles, or using (something like) this
# preference pane:
# http://stackoverflow.com/questions/25385934/setting-environment-variables-via-launchd-conf-no-longer-works-in-os-x-yosemite
# https://github.com/hschmidt/EnvPane
android_sdk_repository(
  name = "android_sdk",
  api_level = 22,
)
