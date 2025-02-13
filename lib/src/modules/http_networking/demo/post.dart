import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/http_networking/demo/request.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => AddPostPageState();
}

class AddPostPageState extends State<AddPostPage> {
  TextEditingController tcTitle = TextEditingController();
  TextEditingController tcBody = TextEditingController();

  _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _addPost(String title, String body) async {
    try {
      await addPosts2(title, body);
      _showSnackbar("Sukses menambahkan");
    } catch (e) {
      _showSnackbar("Gagal menambahkan");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post APP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: tcTitle,
            decoration: InputDecoration(label: Text("Masukkan Title")),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: tcBody,
            decoration: InputDecoration(label: Text("Masukkan Body")),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _addPost(tcTitle.text, tcBody.text);
              Navigator.pop(context, true);
            },
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
}
