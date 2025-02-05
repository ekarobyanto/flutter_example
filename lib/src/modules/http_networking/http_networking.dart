import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/http_networking/model/post.dart';
import 'package:flutter_example/src/modules/http_networking/request/http_request.dart';
import 'package:flutter_example/src/modules/http_networking/model/post.dart';
import 'package:flutter_example/src/modules/http_networking/request/http_request.dart';

class ConsumeApi extends StatefulWidget {
  const ConsumeApi({super.key});

  @override
  State<ConsumeApi> createState() => _ConsumeApiScreenState();
}

class _ConsumeApiScreenState extends State<ConsumeApi> {
  List<Post> _posts = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    setState(() => _isLoading = true);
    try {
      _posts = await getPosts();
    } catch (e) {
      _showSnackbar('Failed to load posts');
    }
    setState(() => _isLoading = false);
  }

  Future<void> _addPost() async {
    try {
      await addPost('New Post', 'This is a newly added post.');
      _fetchPosts(); // Refresh data
      _showSnackbar('Post added successfully');
    } catch (e) {
      _showSnackbar('Failed to add post');
    }
  }

  Future<void> _deletePost(int id) async {
    try {
      await deletePost(id);
      _fetchPosts();
      _showSnackbar('Post deleted');
    } catch (e) {
      _showSnackbar('Failed to delete post');
    }
  }

  Future<void> _patchPost({
    required int id,
    String? title,
    String? body,
  }) async {
    try {
      Map<String, String> data = {};
      if (title != null) {
        data.addEntries([MapEntry('title', title)]);
      }
      if (body != null) {
        data.addEntries([MapEntry('body', body)]);
      }
      await patchPost(id, data);
      _fetchPosts();
      _showSnackbar('Post patched');
    } catch (e) {
      _showSnackbar('Failed to patch post');
    }
  }

  void _showUpdatePostModal(Post post, String method) {
    TextEditingController bodyController =
        TextEditingController(text: post.body);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${method.replaceRange(0, 1, method[0].toUpperCase())} Post',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: bodyController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Post Body',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (bodyController.text.isEmpty) {
                    _showSnackbar('Body cannot be empty');
                    return;
                  }
                  try {
                    Post updatedPost = Post(
                        id: post.id,
                        title: post.title,
                        body: bodyController.text);
                    if (method == 'patch') {
                      await _patchPost(
                        id: post.id,
                        title: null,
                        body: bodyController.text,
                      );
                    } else {
                      await updatePost(updatedPost);
                    }
                    _fetchPosts();
                    Navigator.pop(context);
                    _showSnackbar('Post updated');
                  } catch (e) {
                    _showSnackbar('Failed to update post');
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  State<ConsumeApi> createState() => _ConsumeApiScreenState();
}

class _ConsumeApiScreenState extends State<ConsumeApi> {
  List<Post> _posts = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    setState(() => _isLoading = true);
    try {
      _posts = await getPosts();
    } catch (e) {
      _showSnackbar('Failed to load posts');
    }
    setState(() => _isLoading = false);
  }

  Future<void> _addPost() async {
    try {
      await addPost('New Post', 'This is a newly added post.');
      _fetchPosts(); // Refresh data
      _showSnackbar('Post added successfully');
    } catch (e) {
      _showSnackbar('Failed to add post');
    }
  }

  Future<void> _deletePost(int id) async {
    try {
      await deletePost(id);
      _fetchPosts();
      _showSnackbar('Post deleted');
    } catch (e) {
      _showSnackbar('Failed to delete post');
    }
  }

  Future<void> _patchPost(int id) async {
    try {
      await patchPost(id, {'title': 'Patched Title'});
      _fetchPosts();
      _showSnackbar('Post patched');
    } catch (e) {
      _showSnackbar('Failed to patch post');
    }
  }

  void _showUpdatePostModal(Post post, String method) {
    TextEditingController bodyController =
        TextEditingController(text: post.body);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Update Post',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: bodyController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Post Body',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (bodyController.text.isEmpty) {
                    _showSnackbar('Body cannot be empty');
                    return;
                  }
                  try {
                    Post updatedPost = Post(
                        id: post.id,
                        title: post.title,
                        body: bodyController.text);
                    if (method == 'patch') {
                      await patchPost(post.id, {'body': bodyController.text});
                    } else {
                      await updatePost(updatedPost);
                    }
                    _fetchPosts();
                    Navigator.pop(context); // Close modal
                    _showSnackbar('Post updated');
                  } catch (e) {
                    _showSnackbar('Failed to update post');
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consume API')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'delete') {
                        _deletePost(post.id);
                      } else if (value == 'update' || value == 'patch') {
                        _showUpdatePostModal(post, value);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                          value: 'update', child: Text('Update Post')),
                      const PopupMenuItem(
                          value: 'patch', child: Text('Patch Post')),
                      const PopupMenuItem(
                          value: 'delete', child: Text('Delete Post')),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPost,
        child: const Icon(Icons.add),
      ),
    );
  }
}
