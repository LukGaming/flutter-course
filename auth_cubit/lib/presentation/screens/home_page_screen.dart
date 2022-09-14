import 'package:auth_cubit/Cubit/Auth/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).logout();
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: const Center(
        child: Text("Home page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<AuthCubit>(context).showUserId();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}