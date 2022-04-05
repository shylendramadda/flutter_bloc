# flutter_block
Flutter practice with BLoC design pattern

Few useful commands:
	Flutter version: flutter --version
	To validate and determine if there are any platform dependencies: flutter doctor -v
	To list the connected devices: flutter devices
	To upgrade the flutter: flutter upgrade
	To check the channels: flutter channel
	To change channel: flutter channel <channel_name>
	To list the emulator: emulator -list-avds
	To use an emulator: emulator -avd <emulator_name>
	To run the flutter app: flutter run
	To create apk: flutter build apk
	To install an apk on a device: flutter install
	Development build: flutter run -t lib/main_dev.dart
	Production build: flutter run -t lib/main_prod.dart
	Android release build: flutter build apk -t lib/main_ENVIRONMENT.dart
	iOS release build: flutter build ios -t lib/main_ENVIRONMENT.dart
	create android key: **/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/bin/keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias redpro **
	create app bundle and slpit as per platform specific: flutter build appbundle --release --target-platform android-arm,android-arm64,android-x64 -t lib/main_prod.dart
	Without split: flutter build appbundle --release -t lib/main_prod.dart
