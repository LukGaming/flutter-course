import 'package:flutter/material.dart';
import 'package:real_free_auth/controllers/login_or_register_controller.dart';
import 'package:real_free_auth/views/home_page_view.dart';
import 'package:real_free_auth/views/login_or_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogged = false;
  @override
  void initState() {
    UserController.verifyIfUserIsLogged().then((value) {
      setState(() {
        isLogged = value;
      });
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLogged ? const HomePageView() : const LoginOrRegisterView(),
    );
  }
}
