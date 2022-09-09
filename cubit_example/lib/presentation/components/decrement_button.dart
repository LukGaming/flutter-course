import 'package:cubit_example/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecrementButtonWidget extends StatelessWidget {
  const DecrementButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        BlocProvider.of<CounterCubit>(context).increment();
      },
      child: const Icon(Icons.add),
    );
  }
}
