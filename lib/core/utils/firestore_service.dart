import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> toggleLike(String userId, String postId, bool isLiked) async {
    final userRef = _db.collection('users').doc(userId);
    final postRef = _db.collection('posts').doc(postId);

    print('⚡ toggleLike: userId=$userId, postId=$postId, isLiked=$isLiked');

    await _db.runTransaction((transaction) async {
      final userSnap = await transaction.get(userRef);
      final postSnap = await transaction.get(postRef);

      if (!userSnap.exists) {
        print('👤 user doc not found, creating new...');
        transaction.set(userRef, {'likedPosts': []});
      }

      if (!postSnap.exists) {
        print('🚫 post doc not found. Aborting.');
        throw Exception('Post $postId does not exist.');
      }

      final userLikes = List<String>.from(userSnap.data()?['likedPosts'] ?? []);
      final postLikes = List<String>.from(postSnap.data()?['likedBy'] ?? []);

      if (isLiked) {
        if (!userLikes.contains(postId)) userLikes.add(postId);
        if (!postLikes.contains(userId)) postLikes.add(userId);
      } else {
        userLikes.remove(postId);
        postLikes.remove(userId);
      }

      print('📤 updating Firestore: likedPosts=$userLikes, likedBy=$postLikes');

      try {
        transaction.update(userRef, {'likedPosts': userLikes});
        transaction.update(postRef, {'likedBy': postLikes});
      } catch (e) {
        print('❌ Firestore update error: $e');
      }
    }).catchError((error) {
      print('🔥 Firestore transaction failed: $error');
    });
  }

  Future<List<String>> getLikedPosts(String userId) async {
    final userDoc = await _db.collection('users').doc(userId).get();
    return List<String>.from(userDoc.data()?['likedPosts'] ?? []);
  }

  Future<List<String>> getLikedPostsForUser(String userId) async {
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    final List<dynamic> liked = userDoc.data()?['likedPosts'] ?? [];
    return List<String>.from(liked);
  }
}