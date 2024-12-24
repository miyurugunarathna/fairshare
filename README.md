# fairshare

A new Flutter project.

## Project Setup

- Create a .env file within the root directory with the keys listed in the .env.example file

- Run `flutter pub get` to install the dependencies

### Android Build

- Run `flutter build appbundle --obfuscate --split-debug-info="./build/debug_info" --no-tree-shake-icons`

### IOS Build

- Run `flutter build ipa --obfuscate --split-debug-info="./build/debug_info" --no-tree-shake-icons --release`

- Upload the generated .ipa file to App Store Connect through the Transporter app
