import 'package:auth_cubit/constants/validations.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return email_empty_or_null;
  }
  if (email.length == 0) {
    return email_empty_or_null;
  }
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!emailValid.hasMatch(email)) {
    return email_format_incorrect;
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return incorrent_password;
  }
  return null;
}
