import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  const AspectRatioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aspect Ratio"),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.red,
              child: const Center(
                child: Text("16:9 Aspect Ratio"),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text("4:3 Aspect Ratio"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
