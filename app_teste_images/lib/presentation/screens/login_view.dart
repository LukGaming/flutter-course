import 'package:app_teste_images/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController usuarioEditingController = TextEditingController();
    TextEditingController senhaEditingController = TextEditingController();
    void logar() {
      if (formKey.currentState!.validate()) {
        context.read<LoginCubit>().logarUsuario(
              usuario: usuarioEditingController.text,
              senha: senhaEditingController.text,
            );
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text(
                    "Usuário",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              TextFormField(
                controller: usuarioEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O campo de usuario não pode ficar vazio";
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Text(
                    "Senha",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "A senha não pode ficar vazio";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                controller: senhaEditingController,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(
                      40), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {
                  logar();
                },
                child: const Text('Logar'),
              ),
              TextButton(
                onPressed: () {
                  print("or parar recuperar senha");
                },
                child: const Text(
                  "Esqueceu sua senha?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<LoginCubit>().irParaRegistrar();
                },
                child: const Text("Não Possui usuário?"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
