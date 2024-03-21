import 'package:auth/models/user_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const initState = Auth(loginType: LoginType.notAssigned);

class UserSettingsNotifier extends StateNotifier<Auth> {
  UserSettingsNotifier() : super(initState);

  setLoginType(LoginType loginType) {
    state = state.copyWith(loginType: loginType);
  }
}

final userSettingsProvider = StateNotifierProvider<UserSettingsNotifier, Auth>(
  (ref) => UserSettingsNotifier(),
);
