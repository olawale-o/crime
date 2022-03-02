import 'package:formz/formz.dart';

enum UsernameValidationError { invalid }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([String value = '']) : super.dirty(value);

  static const int _usernameLength = 2;

  @override
  UsernameValidationError? validator(String? value) {
    return (value ?? '').length > _usernameLength
        ? null
        : UsernameValidationError.invalid;
  }
}
