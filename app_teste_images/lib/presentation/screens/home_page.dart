import 'package:app_teste_images/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("Home page"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final loginCubit = BlocProvider.of<LoginCubit>(context);
          var currentState = loginCubit.state;
          if (currentState is LoggedUserState) {
            print(currentState.password);
            print(currentState.userName);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
