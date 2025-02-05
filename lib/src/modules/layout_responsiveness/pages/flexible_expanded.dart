import 'package:flutter/material.dart';

class FlexibleExpanded extends StatelessWidget {
  const FlexibleExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flexible & Expanded"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: const Center(
                child: Text("Flexible 1"),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text("Flexible 2"),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text("Expanded"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
