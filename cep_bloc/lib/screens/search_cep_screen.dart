import 'dart:convert';

import 'package:cep_bloc/bloc/cubit/cep_cubit.dart';
import 'package:cep_bloc/controllers/cep_controller.dart';
import 'package:cep_bloc/validators/cep_form_validators.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCepPage extends StatefulWidget {
  const SearchCepPage({Key? key}) : super(key: key);

  @override
  State<SearchCepPage> createState() => _SearchCepPageState();
}

class _SearchCepPageState extends State<SearchCepPage> {
  final formKey = GlobalKey<FormState>();
  final cepEditingController = TextEditingController();
  final streetEditingController = TextEditingController();
  final complementEditingController = TextEditingController();
  final districtEditingController = TextEditingController();
  final stateEditingController = TextEditingController();
  final locationEditingController = TextEditingController();
  Widget defaultPadding = const Padding(
    padding: EdgeInsets.all(10.0),
  );
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future<void> submit() async {
      if (formKey.currentState!.validate()) {
        context.read<CepCubit>().findCep(cepEditingController.text);
        // setState(() {
        //   isLoading = true;
        // });
        // CepController.searchCep(cepEditingController.text).then((value) {
        //   if (value == null) return;
        //   streetEditingController.text = value.logradouro ?? "";
        //   complementEditingController.text = value.complemento ?? "";
        //   districtEditingController.text = value.bairro ?? "";
        //   locationEditingController.text = value.localidade ?? "";
        //   stateEditingController.text = value.uf ?? "";
        //   setState(() {
        //     isLoading = false;
        //   });
        // });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Cep Searching..."),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: cepEditingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Cep",
                      ),
                      validator: cepValidator,
                    ),
                    defaultPadding,
                    ElevatedButton(
                      onPressed: () {
                        submit();
                      },
                      child: const Text("Search For Cep"),
                    ),
                    defaultPadding,
                    BlocBuilder<CepCubit, CepState>(
                        builder: (cepBuilder, state) {
                      if (state is CepLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is CepValues) {
                        streetEditingController.text = state.logradouro;
                        complementEditingController.text = state.complemento;
                        districtEditingController.text = state.bairro;
                        locationEditingController.text = state.localidade;
                        stateEditingController.text = state.uf;
                        return Column(
                          children: [
                            Text(state.bairro),
                            TextFormField(
                              controller: streetEditingController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Rua",
                              ),
                            ),
                            defaultPadding,
                            TextFormField(
                              controller: complementEditingController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Complemento",
                              ),
                            ),
                            defaultPadding,
                            TextFormField(
                              controller: districtEditingController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Bairro",
                              ),
                            ),
                            defaultPadding,
                            TextFormField(
                              controller: locationEditingController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Localidade",
                              ),
                            ),
                            defaultPadding,
                            TextFormField(
                              controller: stateEditingController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Estado",
                              ),
                            ),
                            defaultPadding,
                          ],
                        );
                      } else if (state is CepNotFound) {
                        return const Center(
                          child: Text("Cep não encontrado"),
                        );
                      }
                      return Container();
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
