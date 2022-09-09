import 'package:flutter/material.dart';

class ProductFormPage extends StatelessWidget {
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey formKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creating a Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "description",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "value",
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
