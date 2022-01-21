class AuthStateModel {
  final bool isAuthenticating;
  const AuthStateModel({ required this.isAuthenticating });

  AuthStateModel copyWith({
    bool? isAuthenticating
  }) {
    return AuthStateModel(
        isAuthenticating: isAuthenticating ?? this.isAuthenticating,
    );
  }
}

