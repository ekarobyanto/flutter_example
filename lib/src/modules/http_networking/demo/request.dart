import 'dart:convert';

import 'package:flutter_example/src/modules/http_networking/model/post.dart';
import 'package:http/http.dart';

// const String BASE_URL = 'https://jsonplaceholder.typicode.com';
const String BASE_URL = 'https://go-test-post.aswaja-nulife.com';

Future<List<Post>> getPosts2() async {
  Uri url = Uri.parse('$BASE_URL/posts');
  Response response = await get(url);
  if (response.statusCode != 200) {
    throw Exception("Failed to Get posts");
  }
  List<dynamic> data = jsonDecode(response.body);
  return data.map((post) => Post.fromJson(post)).toList();
}

Future<void> addPosts2(String title, String body) async {
  try {
    Uri url = Uri.parse('$BASE_URL/posts');
    Response response = await post(url,
        // headers: {
        //   'Content-type' : 'application/json; charset=UTF-8'
        // },
        body: jsonEncode({'title': title, 'body': body}));
    if (response.statusCode != 201) {
      throw Exception("Failed to add posts");
    }
  } catch (e) {
    throw Exception("Failed to add posts 2");
  }
}
