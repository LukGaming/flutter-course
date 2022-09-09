import 'package:cubit_example/logic/cubit/counter_cubit.dart';
import 'package:cubit_example/presentation/components/decrement_button.dart';
import 'package:cubit_example/presentation/components/increment_button.dart';
import 'package:cubit_example/presentation/screens/home_page_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget padding = const Padding(padding: EdgeInsets.all(10.0));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter example of Bloc"),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("incrementing"),
              duration: Duration(microseconds: 300),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("decrementing"),
              duration: Duration(microseconds: 300),
            ));
          }
        },
        child: Column(
          children: [
            padding,
            Center(
                child: BlocBuilder<CounterCubit, CounterState>(
              buildWhen: (previous, current) =>
                  previous.counterValue != current.counterValue,
              builder: (context, state) {
                if (state.counterValue >= 0) {
                  return Text(
                      "${BlocProvider.of<CounterCubit>(context).state.counterValue}");
                } else {
                  return Text(
                      "Negative Number:  ${BlocProvider.of<CounterCubit>(context).state.counterValue}");
                }
              },
            )),
            padding,
            const IncrementButtonWidget(),
            padding,
            const DecrementButtonWidget(),
            padding,
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                              value: BlocProvider.of<CounterCubit>(context),
                              child: const MyHomePage3(),
                            )),
                    (Route<dynamic> route) => true);
              },
              child: const Text("go to other screen"),
            )
          ],
        ),
      ),
    );
  }
}
