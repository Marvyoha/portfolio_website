import 'package:flutter/material.dart';
import 'package:my_portfolio_website/core/layout_helper.dart';
import 'package:my_portfolio_website/core/providers/layout_provider.dart';
import 'package:my_portfolio_website/pages/mobile/homepage_mobile.dart';
import 'package:my_portfolio_website/pages/pageview_test.dart';
import 'package:provider/provider.dart';

import 'core/providers/theme_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => LayoutProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeMode,
      home: const ResponsiveLayout(),
    );
  }
}
