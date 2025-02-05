import 'package:flutter/material.dart';

class NavigationPage2 extends StatelessWidget {
  const NavigationPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Navigation Page 2"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Navigation Page 2"),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
