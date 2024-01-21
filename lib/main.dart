import 'package:azercell_developer_assignment/src/foundation/configure_app.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

Future<void> main() async {
  await configureApp();

  runApp(
    const App(),
  );
}
