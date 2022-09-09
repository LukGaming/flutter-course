import 'package:cubit_example/logic/cubit/counter_cubit.dart';
import 'package:cubit_example/presentation/components/decrement_button.dart';
import 'package:cubit_example/presentation/components/increment_button.dart';
import 'package:cubit_example/presentation/screens/home_page_1.dart';
import 'package:cubit_example/presentation/screens/home_page_2.dart';
import 'package:cubit_example/presentation/screens/home_page_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const MyHomePage(),
          '/second': (context) => const MyHomePage2(),
          '/third': (context) => const MyHomePage3(),
        },
      ),
    );
  }
}
