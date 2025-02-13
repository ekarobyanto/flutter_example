import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/http_networking/request/http_request.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  TextEditingController tcBody = TextEditingController();
  TextEditingController tcTitle = TextEditingController();
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _addPost(String title, String body) async {
    try {
      await addPost(title, body);
      _showSnackbar('Post added successfully');
    } catch (e) {
      _showSnackbar('Failed to add post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Post"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          TextField(
            controller: tcTitle,
            decoration: const InputDecoration(label: Text("Masukkan title")),
          ),
          TextField(
            controller: tcBody,
            decoration: const InputDecoration(label: Text("Masukkan body")),
          ),
          ElevatedButton(
              onPressed: () {
                _addPost(tcTitle.text, tcBody.text);
                Navigator.pop(context, true);
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
