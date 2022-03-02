import 'package:formz/formz.dart';
import '../validators/email_validator.dart';
import '../validators/password_validator.dart';
import '../validators/username_validator.dart';

class AuthStateModel {
  final bool _isAuthenticating;
  final Email _email;
  final Password _password;
  final Username _username;
  final String? _errorMessage;
  final FormzStatus _status;
  const AuthStateModel({
    required bool isAuthenticating,
    Email email = const Email.pure(),
    Password password = const Password.pure(),
    Username username = const Username.pure(),
    String? errorMessage,
    FormzStatus status = FormzStatus.pure,
  })
      : _isAuthenticating = isAuthenticating,
      _password = password,
      _email = email,
      _username = username,
      _status = status,
      _errorMessage = errorMessage;

  bool get isAuthenticating => _isAuthenticating;
  Email get email => _email;
  Username get username => _username;
  Password get password => _password;
  String? get errorMessage => _errorMessage;
  FormzStatus get status => _status;

  AuthStateModel copyWith({
    bool? isAuthenticating,
    Email? email,
    Username? username,
    Password? password,
    String? errorMessage,
    FormzStatus? status
  }) {
    return AuthStateModel(
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      email: email ?? _email,
      username: username ?? _username,
      password: password ?? _password,
      errorMessage: errorMessage ?? _errorMessage,
      status: status ?? _status,
    );
  }
}
