import 'dart:convert';

import 'package:cep_bloc/models/cep_request.dart';
import 'package:cep_bloc/models/cep_response.dart';
import 'package:cep_bloc/repository/cep_repository.dart';

class CepBusiness {
  static Future<CepResponse?> cepRequest(CepRequest cepRequest) async {
    var baseRepository = CepRepository();
    var response = await baseRepository.getRequest(cepRequest.cep);
    if (response == null) return null;

    CepResponse cepResponse = CepResponse.fromJson(
      response,
    );
    return cepResponse;
  }
}
