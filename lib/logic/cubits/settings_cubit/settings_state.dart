part of 'settings_cubit.dart';

// ignore: must_be_immutable
class SettingsState extends Equatable {
  bool appNotifications;
  bool emailNotifications;

  SettingsState(
      {required this.appNotifications, required this.emailNotifications});

  @override
  List<Object> get props => [
        emailNotifications,
        appNotifications,
      ];

  SettingsState copyWith({
    bool? appNotifications,
    bool? emailNotifications,
  }) {
    return SettingsState(
      appNotifications: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  @override
  String toString() =>
      'SettingsState(appNotifications: $appNotifications, emailNotifications: $emailNotifications)';
}
