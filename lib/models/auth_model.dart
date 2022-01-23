class AuthStateModel {
  final bool _isAuthenticating;
  const AuthStateModel({required bool isAuthenticating})
      : _isAuthenticating = isAuthenticating;

  bool get isAuthenticating => _isAuthenticating;

  AuthStateModel copyWith({bool? isAuthenticating}) {
    return AuthStateModel(
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
    );
  }
}
