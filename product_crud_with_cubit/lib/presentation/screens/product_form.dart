import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_crud_with_cubit/cubit/product/product_cubit.dart';
import 'package:product_crud_with_cubit/data/models/product.dart';
import 'package:product_crud_with_cubit/validations/product_validations.dart';

class ProductFormView extends StatelessWidget {
  final bool isEditing;
  final Product? product;
  const ProductFormView({Key? key, this.isEditing = false, this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context);
    Widget sizedBox = const SizedBox(
      height: 10,
    );
    TextEditingController nameEditingController = TextEditingController();
    TextEditingController descriptionEditingController =
        TextEditingController();
    TextEditingController priceEditingController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    if (isEditing) {
      nameEditingController.text = product!.name;
      descriptionEditingController.text = product!.description;
      priceEditingController.text = product!.price;
    }
    void submitForm() async {
      if (formKey.currentState!.validate()) {
        if (!isEditing) {
          await productCubit
              .createProduct(
                name: nameEditingController.text,
                description: descriptionEditingController.text,
                price: priceEditingController.text,
              )
              .then(
                (value) => Navigator.of(context).pop(),
              );
        } else {
          productCubit
              .editProduct(
                id: product!.id,
                name: nameEditingController.text,
                description: descriptionEditingController.text,
                price: priceEditingController.text,
              )
              .then(
                (value) => Navigator.of(context).pop(),
              );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: isEditing
            ? Text(
                'Editing: ${product?.name}',
              )
            : const Text(
                "Creating a product",
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                    ),
                    controller: nameEditingController,
                    validator: productNameValidation,
                  ),
                  sizedBox,
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Description"),
                    ),
                    controller: descriptionEditingController,
                    validator: productDescriptionValidation,
                  ),
                  sizedBox,
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Price"),
                    ),
                    controller: priceEditingController,
                    keyboardType: TextInputType.number,
                    validator: productPriceValidation,
                  ),
                  TextButton(
                    child: const Text("Submit"),
                    onPressed: () {
                      submitForm();
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}
