import 'package:auth/models/user_settings.dart';
import 'package:auth/provider/auth.dart';
import 'package:auth/utils/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppPage extends ConsumerStatefulWidget {
  const AppPage({super.key});

  @override
  ConsumerState<AppPage> createState() {
    return _AppPageState();
  }
}

class _AppPageState extends ConsumerState<AppPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    AppDb.database?.userSettingsDao.getSettings();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        AppDb.close();
        break;
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
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
