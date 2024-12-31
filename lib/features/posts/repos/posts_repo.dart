import 'dart:convert';

import 'package:flutter_bloc_api/features/posts/models/post_data_ui_models.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataUiModels>> fetchPosts() async {
    var client = http.Client();
    List<PostDataUiModels> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        List result = json.decode(response.body);
        for (int i = 0; i < result.length; i++) {
          PostDataUiModels post =
              PostDataUiModels.fromMap(result[i] as Map<String, dynamic>);
          posts.add(post);
        }
      }
      return posts;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();

    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        'title': 'Flutter Developer',
        'body': 'In Organization required 2 flutter developer',
        'userId': '100'
      });

      if (response.statusCode >= 200 && response.statusCode < 300 ) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
