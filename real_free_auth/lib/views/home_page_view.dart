import 'package:flutter/material.dart';
import 'package:real_free_auth/controllers/login_or_register_controller.dart';
import 'package:real_free_auth/controllers/user_controller.dart';
import 'package:real_free_auth/utils/menu_options.dart';
import 'package:real_free_auth/views/login_or_register.dart';

Iterable<String> menuOptions = {
  settings,
  logout,
};

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? handleMenuChoice(String choice) {
      switch (choice) {
        case settings:
          break;
        case logout:
          UserController.logout().then(
            (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginOrRegisterView(),
              ),
            ),
          );
          break;
        default:
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          PopupMenuButton<String>(
              onSelected: handleMenuChoice,
              itemBuilder: (BuildContext context) =>
                  menuOptions.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList())
        ],
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
