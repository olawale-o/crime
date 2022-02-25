import 'package:formz/formz.dart';
import '../validators/email_validator.dart';
import '../validators/password_validator.dart';

class AuthStateModel {
  final bool _isAuthenticating;
  final Email _email;
  final Password _password;
  final String? _errorMessage;
  final FormzStatus _status;
  const AuthStateModel({
    required bool isAuthenticating,
    Email email = const Email.pure(),
    Password password = const Password.pure(),
    String? errorMessage,
    FormzStatus status = FormzStatus.pure,
  })
      : _isAuthenticating = isAuthenticating,
      _password = password,
      _email = email,
      _status = status,
      _errorMessage = errorMessage;

  bool get isAuthenticating => _isAuthenticating;
  Email get email => _email;
  Password get password => _password;
  String? get errorMessage => _errorMessage;
  FormzStatus get status => _status;

  AuthStateModel copyWith({
    bool? isAuthenticating,
    Email? email,
    Password? password,
    String? errorMessage,
    FormzStatus? status
  }) {
    return AuthStateModel(
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      email: email ?? _email,
      password: password ?? _password,
      errorMessage: errorMessage ?? _errorMessage,
      status: status ?? _status,
    );
  }
}
