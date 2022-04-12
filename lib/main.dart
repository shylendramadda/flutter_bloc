import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/logic/cubits/settings_cubit.dart';
import 'package:flutter_block/logic/utility/app_bloc_oberver.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/cubits/counter_cubit.dart';
import 'logic/cubits/internet_cubit.dart';
import 'presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
      () => runApp(MyApp(
            appRouter: AppRouter(),
            connectivity: Connectivity(),
          )),
      storage: storage,
      blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({Key? key, required this.appRouter, required this.connectivity})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InternetCubit(connectivity)),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => SettingsCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter BLoC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
