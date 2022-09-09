import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cep_bloc/business/cep_business.dart';
import 'package:cep_bloc/controllers/cep_controller.dart';
import 'package:meta/meta.dart';

part 'cep_state.dart';

class CepCubit extends Cubit<CepState> {
  CepCubit()
      : super(
          CepValues(
              logradouro: "",
              complemento: "",
              bairro: "",
              localidade: "",
              uf: "",
              ibge: "",
              gia: "",
              ddd: "",
              siafi: ""),
        );
  void findCep(String cep) async {
    emit(CepLoading());
    final cepResponse = await CepController.searchCep(cep);
    emit(
      CepValues(
        logradouro: cepResponse?.logradouro ?? "",
        complemento: cepResponse?.complemento ?? "",
        bairro: cepResponse?.bairro ?? "",
        localidade: cepResponse?.localidade ?? "",
        uf: cepResponse?.uf ?? "",
        ibge: cepResponse?.ibge ?? "",
        gia: cepResponse?.gia ?? "",
        ddd: cepResponse?.ddd ?? "",
        siafi: cepResponse?.siafi ?? "",
      ),
    );
    Timer(Duration(seconds: 2), () {
      emit(CepNotFound());
    });
  }
}
