import 'package:flutter/material.dart';
import 'package:real_free_auth/components/utils/dialog.dart';
import 'package:real_free_auth/controllers/login_or_register_controller.dart';
import 'package:real_free_auth/controllers/user_controller.dart';
import 'package:real_free_auth/repositories/user_repository.dart';
import 'package:real_free_auth/views/home_page_view.dart';

class LoginOrRegisterView extends StatefulWidget {
  const LoginOrRegisterView({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterView> createState() => _LoginOrRegisterViewState();
}

class _LoginOrRegisterViewState extends State<LoginOrRegisterView> {
  bool isLoading = false;
  bool isRegistering = true;
  Widget spaceBetweenTextField = const SizedBox(
    height: 20,
  );
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  Future<void> handleResultRequest(response) async {
    setState(() {
      isLoading = false;
    });
    if (isRegistering) {
      if (response["result"] == false) {
        DefaultDialog.showMyDialog(context, true, response["message"]);
      } else {
        DefaultDialog.showMyDialog(context, false,
                "Cadastro efetuado com sucesso, clique para logar")
            .then((value) {
          setState(() {
            isRegistering = false;
          });
        });
      }
    } else {
      if (response["sucesso"] == true) {
        var saveUserToStorage = await UserController.setUserStorage(
            response["dados"]["usuarioLogado"]);
        if (saveUserToStorage == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePageView(),
            ),
          );
        }
      }
    }
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      if (isRegistering) {
        LoginOrRegisterController.register(
          nameController.text,
          emailController.text,
          phoneController.text,
          passwordController.text,
        ).then((response) {
          handleResultRequest(response);
        });
      } else {
        LoginOrRegisterController.login(
          emailController.text,
          passwordController.text,
        ).then((response) {
          handleResultRequest(response);
        });
      }
    }
  }

  @override
  void initState() {
    UserRepository.getUserStorage().then(
      (value) {
        if (value != null && value.idDoUsuario > 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePageView(),
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(isRegistering ? "Register Page" : "Login Page"),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      if (isRegistering)
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Name",
                          ),
                          controller: nameController,
                          validator: (value) {
                            if (value == null ||
                                value.toString().length <= 5 ||
                                value.isEmpty) {
                              return "the name cannot have less than 5 characteres";
                            }
                            return null;
                          },
                        ),
                      if (isRegistering) spaceBetweenTextField,
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "email",
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (!validateEmail(value.toString())) {
                            return "invalid email";
                          }
                          return null;
                        },
                      ),
                      spaceBetweenTextField,
                      if (isRegistering)
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Phone",
                          ),
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "The Phone cannot be null";
                            }
                            return null;
                          },
                        ),
                      if (isRegistering) spaceBetweenTextField,
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "password",
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "The password is required";
                          }
                          if (value.toString().length < 8) {
                            return "The password has to contain at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      spaceBetweenTextField,
                      InkWell(
                        onTap: () {
                          validateForm();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            isRegistering ? "Register" : "login",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      spaceBetweenTextField,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isRegistering = !isRegistering;
                              });
                            },
                            child: Text(isRegistering
                                ? "Alredy Registered?"
                                : "Create Account"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
