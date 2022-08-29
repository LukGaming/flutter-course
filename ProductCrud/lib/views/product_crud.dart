import 'package:flutter/material.dart';
import 'package:product_crud/models/category.dart';
import 'package:product_crud/models/product.dart';
import 'package:product_crud/services/category_service.dart';

class ProductCrud extends StatefulWidget {
  final bool isEditing;
  final Product? product;
  ProductCrud({Key? key, required this.isEditing, this.product})
      : super(key: key);

  @override
  State<ProductCrud> createState() => _ProductCrudState();
}

class _ProductCrudState extends State<ProductCrud> {
  final _formKey = GlobalKey<FormState>();
  final textNameController = TextEditingController();
  final textDescriptionController = TextEditingController();
  final textPriceController = TextEditingController();
  var categoryValue = null;
  List<Category> categories = [];
  void _submitForm() {
    print(textNameController.text);
    print(textDescriptionController.text);
    print(textPriceController.text);
    print(categoryValue.id);
  }

  @override
  void initState() {
    print("iniciando");
    CategoryService.getCategories().then(
      (value) {
        setState(() {
          categories = value;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editing Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: textNameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: textDescriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: textDescriptionController,
                decoration: const InputDecoration(
                  labelText: "price",
                ),
              ),
              Container(
                height: 10,
              ),
              DropdownButton(
                value: categoryValue,
                isExpanded: true,
                hint: const Text("Select a Category"),
                items: categories
                    .map<DropdownMenuItem<Category>>((Category category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    print(value);
                    categoryValue = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    _submitForm();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
