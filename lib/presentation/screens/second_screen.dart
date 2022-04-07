import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubits/counter_cubit.dart';
import '../../utils/url_controller.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  GlobalKey<ScaffoldState> secondScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: secondScreenKey,
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
                    heroTag: "1",
                    backgroundColor: widget.color,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.read<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove)),
                FloatingActionButton(
                    heroTag: "2",
                    backgroundColor: widget.color,
                    onPressed: () {
                      // BlocProvider.of<CounterCubit>(context).increment();
                      context.read<CounterCubit>().increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 300),
    ));
  }
}
