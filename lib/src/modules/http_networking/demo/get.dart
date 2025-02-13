import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/http_networking/demo/post.dart';
import 'package:flutter_example/src/modules/http_networking/demo/request.dart';
import 'package:flutter_example/src/modules/http_networking/model/post.dart';

class PostPage2 extends StatefulWidget {
  const PostPage2({super.key});

  @override
  State<PostPage2> createState() => _PostPage2State();
}

class _PostPage2State extends State<PostPage2> {
  List<Post> _posts = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _fetchPosts() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _posts = await getPosts2();
      _showSnackbar("Sukses memanggil");
    } catch (e) {
      _showSnackbar("gagal memanggil");
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consume API"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool res = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPostPage(),
              ));
          if (res) {
            _fetchPosts();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
