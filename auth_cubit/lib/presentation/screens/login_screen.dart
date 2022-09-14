import 'package:auth_cubit/Cubit/Auth/auth_cubit.dart';
import 'package:auth_cubit/validators/login_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    Widget sizedBox = const SizedBox(height: 10);
    void submit() {
      if (formKey.currentState!.validate()) {}
      BlocProvider.of<AuthCubit>(context)
          .login(emailEditingController.text, passwordEditingController.text);
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "email",
                      ),
                      validator: emailValidator,
                      controller: emailEditingController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    sizedBox,
                    TextFormField(
                      controller: passwordEditingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "senha",
                      ),
                      obscureText: true,
                      validator: passwordValidator,
                    ),
                    sizedBox,
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        submit();
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
