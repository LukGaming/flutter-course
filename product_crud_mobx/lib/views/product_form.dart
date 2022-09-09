import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();
    Widget spaceBetweenFields = Container(height: 5);
    final formKey = GlobalKey<FormState>();
    void validateForm() {
      if (formKey.currentState!.validate()) {
        print("validating...");
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Creating Products"),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Product Name"),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'The name of product Cannot be Null';
                        }
                        return null;
                      },
                    ),
                    spaceBetweenFields,
                    TextFormField(
                      controller: descriptionController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Description",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'The description of product Cannot be Null';
                        }
                        return null;
                      },
                    ),
                    spaceBetweenFields,
                    TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Price",
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.parse(value) <= 0) {
                          return 'The price of product Cannot be 0';
                        }
                        return null;
                      },
                    ),
                    spaceBetweenFields,
                    ElevatedButton(
                      onPressed: () {
                        validateForm();
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              )),
        ));
  }
}
