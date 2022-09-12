import 'package:client/dependencies_provider.dart';
import 'package:client/themes.dart';
import 'package:flutter/material.dart';

import 'helpers/navigation_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DependenciesProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: createLightTheme(),
        onGenerateRoute: NavigationHelper.generateRoutes,
        initialRoute: NavigationHelper.routes.login
      ),
    );
  }
}
