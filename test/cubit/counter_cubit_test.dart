import 'package:flutter_block/business_logic/cubits/counter/counter_cubit.dart';
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
  });
}
