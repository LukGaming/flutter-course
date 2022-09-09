part of 'cep_cubit.dart';

@immutable
abstract class CepState {}

class CepValues extends CepState {
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;
  CepValues({
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });
}

class CepLoading extends CepState {}

class CepNotFound extends CepState {}
