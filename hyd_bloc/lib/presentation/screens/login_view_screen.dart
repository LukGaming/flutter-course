import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyd_bloc/bloc/Auth/auth_cubit.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = BlocProvider.of<AuthCubit>(context);
    TextEditingController emailEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();
    GlobalKey formKey = GlobalKey<FormState>();
    void submitForm() {
      authProvider.logUser(
        emailEditingController.text,
        passwordEditingController.text,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hydrated Bloc example"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailEditingController,
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
              ),
              TextFormField(
                controller: passwordEditingController,
                decoration: const InputDecoration(
                  label: Text("Senha"),
                ),
              ),
              TextButton(
                onPressed: () {
                  submitForm();
                },
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
