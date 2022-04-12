import 'package:flutter/material.dart';
import 'package:flutter_block/presentation/screens/settings_screen.dart';

import '../../logic/cubits/counter_cubit.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: "Second Screen",
            color: Colors.amberAccent,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: "Third Screen",
            color: Colors.orangeAccent,
          ),
        );
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
