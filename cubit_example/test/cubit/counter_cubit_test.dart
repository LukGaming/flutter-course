import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_example/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CounterCubit", () {
    CounterCubit counterCubit;
    counterCubit = CounterCubit();
    test('it should return a CounterCubit with value 0', () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });
    blocTest(
      "it should CounterCubit   CounterState(counterValue: 1, wasIncremented: true)",
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );
  });
}
