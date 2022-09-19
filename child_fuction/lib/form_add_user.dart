import 'dart:math';

import 'package:child_fuction/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    GlobalKey formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adding User"),
      ),
      body: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Idade",
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                      User(
                        id: Random().nextInt(1000),
                        name: nameController.text,
                        idade: int.tryParse(ageController.text),
                      ),
                    );
                  },
                  child: const Text("Submit"))
            ],
          )),
    );
  }
}
