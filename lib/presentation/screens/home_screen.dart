import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubits/counter/counter_cubit.dart';
import '../../utils/url_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title, required this.color})
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('End Point: ${URLController.endPoint}'),
            const SizedBox(height: 14),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.read<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove)),
                FloatingActionButton(
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
                style: TextStyle(color: Colors.white),
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
