import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/animations/animations.dart';
import 'package:flutter_example/src/modules/http_networking/http_networking.dart';
import 'package:flutter_example/src/modules/layout_responsiveness/layout_responsive_page.dart';
import 'package:flutter_example/src/modules/local_storage/local_storage.dart';
import 'package:flutter_example/src/modules/navigation/navigation.dart';
import 'package:flutter_example/src/modules/state_management/state_management.dart';

import 'modules/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        "/responsive-page": (context) => const LayoutResponsivePage(),
        "/navigation": (context) => const NavigationPage(),
        "/state-management": (context) => const StateManagement(),
        "/local-storage": (context) => const LocalStorage(),
        "/consume-api": (context) => const ConsumeApi(),
        "/animation": (context) => const AnimationPages(),
      },
      home: const HomePage(),
    );
  }
}
