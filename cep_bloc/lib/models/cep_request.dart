class CepRequest {
  late String cep;

  CepRequest({required this.cep});

  CepRequest.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    return data;
  }
}
