import 'package:cloud_firestore/cloud_firestore.dart';

class PostService {
  final CollectionReference _postsCollection =
      FirebaseFirestore.instance.collection('posts');

  // Create a new post
  Future<void> createPost(String userId, String content) async {
    try {
      await _postsCollection.add({
        'userId': userId,
        'content': content,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      // Handle create post errors
      print('Create post error: $e');
    }
  }

  // Retrieve all posts
  Stream<QuerySnapshot> getPosts() {
    return _postsCollection.orderBy('timestamp', descending: true).snapshots();
  }
}
