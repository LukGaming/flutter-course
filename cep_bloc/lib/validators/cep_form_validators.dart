String? cepValidator(cep) {
  final RegExp regex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
  if (cep == null || cep.isEmpty) {
    return "Please insert a Cep.";
  }
  if (cep.toString().length != 8) {
    return "A cep has to contain 8 digits.";
  }
  return null;
}
