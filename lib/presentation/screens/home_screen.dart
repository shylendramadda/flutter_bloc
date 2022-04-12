import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enums.dart';
import '../../logic/cubits/counter_cubit.dart';
import '../../logic/cubits/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenKey,
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: ((context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.wifi) {
                return const Text(
                  "Wifi",
                  style: TextStyle(fontSize: 22),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.mobile) {
                return const Text(
                  "Mobile",
                  style: TextStyle(fontSize: 22),
                );
              } else {
                return const CircularProgressIndicator();
              }
            })),
            const Text('The Counter value is:'),
            const SizedBox(height: 14),
            BlocConsumer<CounterCubit, CounterState>(
              listener: ((context, state) => showSnackbar(context,
                  state.wasIncremented ? "Incremented!" : "Decremented!")),
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    "Negative " + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 0) {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    "Even " + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            const SizedBox(height: 24),
            Builder(builder: (context) {
              // final counterState = context.watch<CounterCubit>().state;
              // final internetState = context.watch<InternetCubit>().state;
              // if (internetState is InternetConnected &&
              //     internetState.connectionType == ConnectionType.wifi) {
              //   return Text(
              //     'Counter:' +
              //         counterState.counterValue.toString() +
              //         ' Internet: Wifi',
              //     style: const TextStyle(fontSize: 22),
              //   );
              // } else if (internetState is InternetConnected &&
              //     internetState.connectionType == ConnectionType.mobile) {
              //   return Text(
              //     'Counter:' +
              //         counterState.counterValue.toString() +
              //         ' Internet: Mobile',
              //     style: const TextStyle(fontSize: 22),
              //   );
              // } else {
              //   return const Text('NO CONNECTION');
              // }
              final count = context.select(
                  (CounterCubit cubit) => cubit.state.counterValue == 5);
              return Text('Is it number 5? $count');
            }),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    heroTag: "decrement",
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.read<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove)),
                FloatingActionButton(
                    heroTag: "Increment",
                    onPressed: () {
                      // BlocProvider.of<CounterCubit>(context).increment();
                      context.read<CounterCubit>().increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add))
              ],
            ),
            const SizedBox(height: 24),
            MaterialButton(
              color: Colors.amberAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: const Text(
                "Got to Second screen",
              ),
            ),
            const SizedBox(height: 24),
            MaterialButton(
              color: Colors.orangeAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text("Got to Third screen"),
            )
          ],
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(s),
      duration: const Duration(milliseconds: 300),
    ));
  }
}
