import 'package:flutter/material.dart';
import 'package:flutter_example/src/app.dart';
import 'package:flutter_example/src/modules/state_management/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
