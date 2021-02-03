import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_management_layout_app/shared/theme_styles.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: AppTheme().themeData(),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
