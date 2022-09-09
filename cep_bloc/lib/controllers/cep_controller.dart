import 'package:cep_bloc/business/cep_business.dart';
import 'package:cep_bloc/models/cep_request.dart';
import 'package:cep_bloc/models/cep_response.dart';

class CepController {
  static Future<CepResponse?> searchCep(String cep) async {
    CepRequest cepRequest = CepRequest(cep: cep);
    var cepResponse = CepBusiness.cepRequest(cepRequest);
    return cepResponse;
  }
}
