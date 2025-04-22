import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<void> uploadPostsToFirestore() async {
  final firestore = FirebaseFirestore.instance;
  final String jsonString = await rootBundle.loadString('lib/database/posts_data.json');
  final Map<String, dynamic> data = jsonDecode(jsonString);

  for (final category in data.keys) {
    final List posts = data[category];

    for (final post in posts) {
      final String postId = post['id'];
      await firestore.collection('posts').doc(postId).set({
        ...post,
        'category': category,
        'likedBy': [],
      });
      print('✅ Uploaded: $postId');
    }
  }

  print('🔥 All posts uploaded to Firestore!');
}