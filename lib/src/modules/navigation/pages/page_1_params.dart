import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/navigation/pages/page_2_params.dart';

class ParamNavigationPage1 extends StatelessWidget {
  const ParamNavigationPage1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parameter Navigation Page 1"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Parameter Navigation Page 1"),
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Enter a message",
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2Params(
                      title: textController.text,
                    ),
                  ),
                ),
                child: const Text("Go to Page 2 with Message"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
