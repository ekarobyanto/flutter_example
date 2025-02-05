import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    const mobileConstraint = 600;
    //to test this, run in windows/macos or web
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout Builder"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < mobileConstraint) {
            return Column(
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  width: double.infinity,
                  child: const Center(
                    child: Text("Mobile View"),
                  ),
                ),
                Container(
                  color: Colors.green,
                  height: 100,
                  width: double.infinity,
                  child: const Center(
                    child: Text("Mobile View"),
                  ),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  width: 200,
                  child: const Center(
                    child: Text("Desktop View"),
                  ),
                ),
                Container(
                  color: Colors.green,
                  height: 100,
                  width: 200,
                  child: const Center(
                    child: Text("Desktop View"),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
