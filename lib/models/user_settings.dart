enum LoginType {
  deviceLock,
  loginPin,
  notAssigned,
}

class Auth {
  final LoginType loginType;

  const Auth({required this.loginType});

  Auth copyWith({loginType}) {
    return Auth(
      loginType: loginType ?? this.loginType,
    );
  }
}
