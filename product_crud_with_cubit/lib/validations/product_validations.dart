import 'dart:ffi';

String? productNameValidation(String? name) {
  if (name == null || name.isEmpty) {
    return "The name cannot be empty.";
  }
  if (name.length > 50) {
    return "The name cannot have more than 50 characteres.";
  }
  return null;
}

String? productDescriptionValidation(String? description) {
  if (description == null || description.isEmpty) {
    return "The description cannot be empty.";
  }
  if (description.length > 500) {
    return "The description cannot have more than 500 characteres.";
  }
  return null;
}

String? productPriceValidation(price) {
  if (price == null) {
    return "The price cannot be empty.";
  }
  if (price == "") {
    return "The price cannot be empty.";
  }
  try {
    price = double.parse(price);
  } catch (e) {
    return "The price can only contains numbers.";
  }
  if (price == 0) {
    return "The price cannot be zero.";
  }

  return null;
}
