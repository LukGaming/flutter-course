import 'package:cubit_example/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementButtonWidget extends StatelessWidget {
  const IncrementButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        BlocProvider.of<CounterCubit>(context).decrement();
      },
      child: const Icon(Icons.remove),
    );
  }
}
