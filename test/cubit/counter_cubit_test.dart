import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_block/logic/cubits/counter_cubit/counter_cubit.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('The initial state of the CounterCubit', () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });

    blocTest(
      'The cubit should emit a CounterState(counterValue: 1, wasIncremented: true) when cubit.increment() is called',
      build: () => counterCubit,
      act: (cubit) => counterCubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'The cubit should emit a CounterState(counterValue: -1, wasIncremented: false) when cubit.increment() is called',
      build: () => counterCubit,
      act: (cubit) => counterCubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
