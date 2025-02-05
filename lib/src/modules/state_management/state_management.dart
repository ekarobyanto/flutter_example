import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/state_management/model/user.dart';
import 'package:flutter_example/src/modules/state_management/providers/user_provider.dart';
import 'package:provider/provider.dart';

class StateManagement extends StatelessWidget {
  const StateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Set User value of UserProvider"),
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Enter a message",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .setUser(User(name: textController.text));
                  FocusScope.of(context).unfocus();
                },
                child: const Text("Save Username"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
