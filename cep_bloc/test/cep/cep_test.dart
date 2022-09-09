import 'package:cep_bloc/validators/cep_form_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Cep validations test", () {
    String testCep1 = "";
    String testCep2 = "75908";
    String testCep3 = "75908854";
    test("Should return 'Please insert a Cep.'", () {
      expect("Please insert a Cep.", cepValidator(testCep1));
    });
    test("Should return 'A cep has to contain 8 digits.'", () {
      expect("A cep has to contain 8 digits.", cepValidator(testCep2));
    });
    test("Should return null", () {
      expect(null, cepValidator(testCep3));
    });
  });
}
