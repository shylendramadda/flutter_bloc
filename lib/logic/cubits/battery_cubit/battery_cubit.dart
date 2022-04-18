import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

part 'battery_state.dart';

class BatteryCubit extends Cubit<BatteryState> {
  static const platform = MethodChannel('flutter.bloctest.test/battery');
  BatteryCubit() : super(BatteryInitial(batteryLevel: 'Unknown'));

  getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = ' $result % .';
      emit(BatteryLoaded(batteryLevel: batteryLevel));
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
      emit(BatteryLoaded(batteryLevel: batteryLevel));
    }
  }
}
