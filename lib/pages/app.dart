import 'package:auth/models/user_settings.dart';
import 'package:auth/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppPage extends ConsumerWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginType = ref.watch(userSettingsProvider).loginType;

    void changeLoginType() {
      ref
          .read(userSettingsProvider.notifier)
          .setLoginType(LoginType.deviceLock);
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hello World"),
              Text("Login Type: $loginType"),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: changeLoginType,
                child: const Text("Change Login type"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
