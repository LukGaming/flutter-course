import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyd_bloc/bloc/Auth/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubitProvider = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              authCubitProvider.logout();
            },
            icon: const Icon(Icons.navigate_next),
          ),
        ],
        title: const Text("Home Page"),
      ),
      body: Column(
        children: [
          const Text("User Logged"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var currentState = authCubitProvider.state;
          if (currentState is LoggedUserState) {
            print(currentState.loggedUser.token);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
