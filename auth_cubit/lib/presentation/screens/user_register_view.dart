import 'package:auth_cubit/Cubit/Auth/auth_cubit.dart';
import 'package:auth_cubit/presentation/widgets/default_sized_box.dart';
import 'package:auth_cubit/validators/login_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRegisterView extends StatelessWidget {
  const UserRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameEditingController = TextEditingController();
    TextEditingController phoneEditingController = TextEditingController();
    TextEditingController emailEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    Widget sizedBox = const SizedBox(height: 10);
    void submit() {
      if (formKey.currentState!.validate()) {}
      context.read<AuthCubit>().registerUser(
            name: nameEditingController.text,
            phone: phoneEditingController.text,
            email: emailEditingController.text,
            password: passwordEditingController.text,
          );
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
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
                            labelText: "Nome",
                          ),
                          // validator: nameValidator,
                          controller: nameEditingController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        sizedBox,
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Telefone",
                          ),
                          // validator: phoneValidator,
                          controller: phoneEditingController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        sizedBox,
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
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
                            labelText: "Senha",
                          ),
                          obscureText: true,
                          validator: passwordValidator,
                        ),
                        sizedBox,
                        TextButton(
                          style:
                              TextButton.styleFrom(backgroundColor: Colors.red),
                          onPressed: () {
                            submit();
                          },
                          child: const Text(
                            "Registrar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<AuthCubit>().goToLoginView();
                },
                child: const Text("Já possui uma conta?"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
