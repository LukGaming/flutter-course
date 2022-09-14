import 'package:auth_cubit/constants/validations.dart';
import 'package:auth_cubit/validators/login_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("should return 'O campo de email não pode ficar vazio.'", () {
    var email = "";
    expect(
      emailValidator(email),
      email_empty_or_null,
    );
  });
  test(
    "should return 'O formato do email está incorreto.'",
    () {
      var email = "paulo.mende";
      expect(
        emailValidator(email),
        email_format_incorrect,
      );
    },
  );
  test(
    "should return 'O formato do email está incorreto.'",
    () {
      var email = "paulo.mende@email.";
      expect(
        emailValidator(email),
        email_format_incorrect,
      );
    },
  );
  test(
    "should return 'O formato do email está incorreto.'",
    () {
      var email = "paulo.mendes@email.com";
      expect(
        emailValidator(email),
        null,
      );
    },
  );
}
