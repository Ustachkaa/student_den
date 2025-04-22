import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> toggleLike(String userId, String postId, bool isLiked) async {
    final userRef = _db.collection('users').doc(userId);
    final postRef = _db.collection('posts').doc(postId);

    await _db.runTransaction((transaction) async {
      final userSnap = await transaction.get(userRef);
      final postSnap = await transaction.get(postRef);

      final userLikes = List<String>.from(userSnap.data()?['likedPosts'] ?? []);
      final postLikes = List<String>.from(postSnap.data()?['likedBy'] ?? []);

      if (isLiked) {
        if (!userLikes.contains(postId)) userLikes.add(postId);
        if (!postLikes.contains(userId)) postLikes.add(userId);
      } else {
        userLikes.remove(postId);
        postLikes.remove(userId);
      }

      transaction.update(userRef, {'likedPosts': userLikes});
      transaction.update(postRef, {'likedBy': postLikes});
    });
  }

  Future<List<String>> getLikedPosts(String userId) async {
    final userDoc = await _db.collection('users').doc(userId).get();
    return List<String>.from(userDoc.data()?['likedPosts'] ?? []);
  }
}