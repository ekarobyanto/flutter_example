import 'dart:convert';

import 'package:flutter_example/src/modules/http_networking/model/post.dart';
import 'package:http/http.dart';

// ignore: constant_identifier_names
const String BASE_URL = 'https://jsonplaceholder.typicode.com';
// const String BASE_URL = 'https://go-test-post.aswaja-nulife.com';

Future<List<Post>> getPosts() async {
  Uri url = Uri.parse('$BASE_URL/posts');
  Response response = await get(url);
  print(response.request?.headers?.toString());
  if (response.statusCode != 200) {
    throw Exception('Failed to load posts');
  }
  List<dynamic> data = jsonDecode(response.body);
  return data.map((post) => Post.fromJson(post)).toList();
}

Future<void> addPost(String title, String body) async {
  Uri url = Uri.parse('$BASE_URL/posts');
  try {
    Response response = await post(
      url,
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode(
        {'title': title, 'body': body},
      ),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add post');
    }
  } catch (e) {
    throw Exception('Failed to add post');
  }
}

Future<void> deletePost(int id) async {
  Uri url = Uri.parse('$BASE_URL/posts/$id');
  try {
    Response response = await delete(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  } catch (e) {
    throw Exception('Failed to delete post');
  }
}

Future<void> updatePost(Post post) {
  Uri url = Uri.parse('$BASE_URL/posts/${post.id}');
  try {
    return put(
      url,
      body: jsonEncode(
        {'title': post.title, 'body': post.body},
      ),
    );
  } catch (e) {
    throw Exception('Failed to update post');
  }
}

Future<void> patchPost(int postId, Map<String, dynamic> updatedFields) async {
  Uri url = Uri.parse('$BASE_URL/posts/$postId');

  try {
    Response response = await patch(
      url,
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode(updatedFields),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to patch post');
    }
  } catch (e) {
    throw Exception('Failed to patch post: $e');
  }
}
