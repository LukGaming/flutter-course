import 'package:cubit_example/logic/validators/email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Validations", () {
    String email1 = "paulo.mendes@fmxsolucoes.com.br";
    String email2 = "paulo.mendesfmxsolucoes.com.br";
    String email3 = "paulo.mendes@fmxsolucoes";
    String email4 = "@fmxsolucoes.com.br";
    test("it should return true if the email is correct", () {
      expect(true, validateEmail(email1));
    });
    test("it should return false if the email is not correct", () {
      expect(false, validateEmail(email2));
    });
    test("it should return false if the email is not correct", () {
      expect(false, validateEmail(email3));
    });
    test("it should return false if the email is not correct", () {
      expect(false, validateEmail(email4));
    });
  });
}
