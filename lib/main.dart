import 'package:catbreeds/routes.dart';
import 'package:catbreeds/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await _setup();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _setup() async {
  await dotenv.load();
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: routes(),
    );
  }
}
