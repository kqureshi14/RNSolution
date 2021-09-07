

import 'package:flutter_test/flutter_test.dart';
import 'package:rnsolution/services/validator.dart';
// import 'package:test/test.dart';

void main() {
  test('Empty Email Test', () {
    var result = FieldValidator.validateEmail('');
    expect(result, "Enter Email");
  });
}