part of 'battery_cubit.dart';

class BatteryState {
  String batteryLevel;
  BatteryState({
    required this.batteryLevel,
  });
}

class BatteryInitial extends BatteryState {
  BatteryInitial({required String batteryLevel})
      : super(batteryLevel: batteryLevel);
}

class BatteryLoaded extends BatteryState {
  BatteryLoaded({required String batteryLevel})
      : super(batteryLevel: batteryLevel);
}
