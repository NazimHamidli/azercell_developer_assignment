import 'package:azercell_developer_assignment/src/presentation/register/register_screen.dart';
import 'package:azercell_developer_assignment/src/foundation/scroll_behavior.dart';
import 'package:flutter/material.dart';

import 'foundation/debugging.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        ErrorWidget.builder = errorWidgetBuilder;
        return ScrollConfiguration(
          behavior: const StyledScrollBehavior(),
          child: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          ),
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Azercell Developer Assignment',
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.dark,
      home: const RegisterScreen(),
    );
  }
}
